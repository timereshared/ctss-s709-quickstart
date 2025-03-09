#
# CTSS Utilities command file
#
lt        Load Tape
# TRA 0100 - Transfer to CTSS kernel
er 002000000100
# the following enables trace on A9
#ek 525252000000
# Set the SYSNAM in the AC "CTSS  "
ea 236362626060
sw1
sw2
st        STart
q
