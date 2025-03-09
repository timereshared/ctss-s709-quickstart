#
# CTSS Run command file
#
lt            Load Tape
# TRA 02526 - Transfer to DSKEDT
#er 002000002526
# The following enables trace on A9:
#ek 525252000000
# Set the SYSNAM in the AC "CTSS  "
ea 236362626060
#sw1           Read control from cards.
#sw4           Read control from A2/cards.
st
