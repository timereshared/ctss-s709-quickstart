# Source this into your shell to set up PATH and locations of disks,
# tapes etc
#
# Run this from the root directory of the repo, and then execute all
# commands from there.

# The telnet port to connect to when CTSS is running. Change here if
# desired.
export PORT=7094

# You should not generally need to change any of these
export PATH=scripts:bin:${PATH}
export TAPE=tape
export CMD=cmd
export DASD=dasd
export OUTPUT=output
export TMP=tmp
mkdir -p ${TMP} ${OUTPUT} bin/

echo CTSS environment set. DASD=${DASD} PORT=${PORT}

