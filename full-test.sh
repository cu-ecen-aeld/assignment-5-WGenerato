#!/bin/bash
# This script can be copied into your base directory for use with
# automated testing using assignment-autotest.  It automates the
# steps described in https://github.com/cu-ecen-5013/assignment-autotest/blob/master/README.md#running-tests
set -e

cd `dirname $0`
test_dir=$(pwd)
export FORCE_UNSAFE_CONFIGURE=1
echo "starting test with SKIP_BUILD=\"${SKIP_BUILD}\" and DO_VALIDATE=\"${DO_VALIDATE}\""

# This part of the script always runs as the current user, even when
# executed inside a docker container.
# See the logic in parse_docker_options for implementation
logfile=test.sh.log
# See https://stackoverflow.com/a/3403786
# Place stdout and stderr in a log file
exec > >(tee -i -a "$logfile") 2> >(tee -i -a "$logfile" >&2)

echo "Running test with user $(whoami)"

set +e

# If there's a configuration for the assignment number, use this to look for
# additional tests
if [ -f "conf/assignment.txt" ]; then
    # This is just one example of how you could find an associated assignment
    assignment=$(< "conf/assignment.txt")
    if [ -f "./assignment-autotest/test/${assignment}/assignment-test.sh" ]; then
        echo "Executing assignment test script"
        "./assignment-autotest/test/${assignment}/assignment-test.sh" "$test_dir"
        rc=$?
        if [ $rc -eq 0 ]; then
            echo "Test of assignment ${assignment} complete with success"
        else
            echo "Test of assignment ${assignment} failed with rc=${rc}"
            exit $rc
        fi
    else
        echo "No assignment-test script found for ${assignment}"
        exit 1
    fi
else
    echo "Missing conf/assignment.txt, no assignment to run"
    exit 1
fi

# Ensure the build is complete and rootfs.ext4 is available
if [ ! -f "buildroot/output/images/rootfs.ext4" ]; then
    echo "Error: rootfs.ext4 not found. Ensure the build is complete."
    exit 1
fi

# Start QEMU
echo "Starting QEMU"
./runqemu.sh &

# Wait for QEMU to start
echo "Removing existing SSH key for localhost:10022"
ssh-keygen -R "[localhost]:10022"

echo "Waiting for QEMU to start..."
while ! sshpass -p root ssh -o StrictHostKeyChecking=no -p 10022 root@localhost "echo QEMU is up"; do
    echo "QEMU is not up yet, retrying in 10 seconds..."
    sleep 10
done

echo "QEMU is up and running"

exit ${unit_test_rc}
