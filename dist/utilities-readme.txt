Version: 1.1.15
Date: 2025/05/22


I. Introduction

This directory contains several utilities that I've written and modified for
the IBM 7090.


II. Build utilities

Lunix/Unix:

$ make

The make attempts to figure out which system to make for using uname.

WinBlows:

$ nmake nt


III. To run the utilities

III.1 bsplit

This utility takes the input binary tape image file and splits it into
seperate files.  The command is:

$ bsplit intape outfileroot


III.2 obj2bin

This utility takes the asm7090 object and makes a scatter load tape image.
The command is:

$ obj2bin [options] objectfile tapefile

Where the options are:

   -b           - No BOM (IOCP) word.
   -e           - No EOM (IOCT) word.
   -l loadaddr  - Load address for relocatable objects.
   -o           - Add as overlay.
   -s objnum    - Object segment number.


III.3 bd

This utility performs a BCD dump of a file. The command is:

$ bd [options] bcdfile
$ bd -d [options] dasdfile acc mod cyl head

Where the options are:

   -a           - Use Alternate BCD encoding.
   -b           - Binary record mode.
   -d           - Process DASD file.
   -r           - Process record boundaries.
   -s           - Simh format.
   -v           - Verbose.

The arguments for the DASD mode are:

   acc          - Access
   mod          - Module
   cyl          - Cylinder
   head         - Head


III.4 bincmp

This utility performs a binary compare of two binary tape images. The command
is:

$ bincmp tapefile1 tapefile2


III.5 disasm

This is a simple disassembler for the binary tape images. The command is:

$ disasm [options] tapefile

Where the options are:

   -m           - Use Monitor symbols.

The disassembled source is written to standard out.


III.6 gelbl2txt

This program reads GE labeled BCD tapes, deblocks and writes out text records.
The command is:

$ geblb2txt gelabeltape.bcd textfile.txt

To list only the labels:

$ geblb2txt -l gelabeltape.bcd 


III.7 gendate

This program generates the $DATE and $LIST records for input to IBSYS.
The command is:

$ gendate


III.8 bcd2txt

This program is used to convert BCD tape images to text with optional ANSI 
print control conversion. The command is:

$ bcd2txt [options] infile [outfile] [reclen [blklen]]

Where the options are:

   -a           - Use Alternate BCD encoding.
   -p           - Convert printer controls.
   -s           - Simh format, implies alternate BCD.


III.9 txt2bcd

This program is used to convert text input to a BCD tape image. The command is:

$ txt2bcd [options] infile outfile [reclen [blklen]]

Where the options are:

   -a           - Use Alternate BCD encoding.
   -s           - Simh format, implies alternate BCD.


III.10 obj2img

This utility takes the asm7090 object and makes an image for the CTSS SETUP
program.  The command is:

$ obj2img [options] -o tapefile objectfile [objectfile]


Where the options are:

   -A           - Use Alternate character set.
   -a ACCOUNT   - User Account, default = " M1416CMFL02".
   -b           - BSS mode file.
   -c           - Line marked count file.
   -e EXT       - File Extension, default = TSSDC.
   -f FILE      - File name, default = module IDT.
   -I           - Absolute Image mode
   -l           - LINKs mode file.
   -L addr      - Load address, default = 0100.
   -o tapefile  - Output tape file.
   -q           - Quota mode file.
   -r LEN       - Text mode record length, default = 84.
   -S           - Use simh format.
   -s           - Symbol table file.
   -t           - Text mode file.
   -u           - UFD mode file.
   -x           - 12 bit eXtended text mode file.


III.11 patchdasd

This program patchs DASD images. The command is:

$ patchdasd dasdfile acc mod cyl head offset data [data...]

The arguments for the DASD mode are:

   acc          - Access
   mod          - Module
   cyl          - Cylinder
   head         - Head
   offset       - Offset in record
   data         - Data to patch


III.12 bss2obj

This program converts CTSS object files (BSS format tape) to object format that
lnk7090 uses. The command is:

$ bss2obj [-options] bssname.bcd objname.obj

Where the options are:

   -s           - Simh format.


III.13 punchctss

This program takes CTSS punched output from the DSKEDT program and processes it
into individual files. The command is:

$ punchctss [-options] punchid.tap punchdata.tap [outputdir]

The arguments are:

   punchid.tap   - The tape containing the ID records.
   punchdata.tap - The tape containing the punch data records.
   outputdir     - The output directory for files.

Where the options are:

   -a           - Use Alternate BCD encoding.
   -s           - Simh format, implies alternate BCD.
   -v[d]        - Verbose mode. 'd' Dumps tape records.


III.14 plotcvt

This program takes CTSS plotter output tape and converts it into a PostScript
file. The command is:

$ plotcvt [-options] plot.tap

The arguments are:

   plot.tap      - The tape containing the plotter data.

Where the options are:

   -a           - Use Alternate BCD encoding.
   -f N         - PostScript file name index. Default = 99.
   -p N         - Pixels per inch. Default = 300.
   -r           - Rotate the plot 90 degrees.
   -s           - Simh format, implies alternate BCD.
   -v[d]        - Verbose mode. 'd' Dumps tape records.

The output filename is of the form: calcomp_NNN.ps


III.15 genext

Generate extract control record for the CTSS extract program. The command is:

$ genext mode fname1 fname2 [projname [progname]]

The arguments are:

   mode      - The extract mode. The modes are:
      B      - BSS file.
      L      - Listing file.
      P      - Plotter file.
      T      - Text file.
   fname1    - Filename 1.
   fname2    - Filename 2 (extension).
   projname  - Project name, default = M1416
   progname  - Programmer name, default = GUEST.


III.16 useraddctss

This program does the work to add users to the CTSS system. It creates two
files, ufd.data and quotas.data, and updates two files, timusd.data and
uaccnt.data. It is designed to be run from the CTSS script adduserctss. The
command is:

$ useraddctss programmername programmernumber projectname password \
     diskquota drumquota tapequota comment

Where the arguments are:

   programmername   - Programmer name
   programmernumber - Programmer number
   projectname      - Project name
   password         - Password
   diskquota        - Disk quota
   drumquota        - Drum quota
   tapequota        - Tape quota
   comment          - User comments


III.17 userdelctss

This program does the work of deleting users from the CTSS system. It updates
two files, timusd.data and uaccnt.data. It is designed to be run from the CTSS
script deluserctss. The command is:

$ userdelctss programmername projectname 

Where the arguments are:

   programmername   - Programmer name
   projectname      - Project name


III.18 userreportctss

This program does the work generate user reports of the CTSS system. It accesses
three files, report.data, timusd.data and uaccnt.data. It is designed to be run
from the CTSS script reportuserctss. The
command is:

$ userreportctss programmername projectname detail

Where the arguments are:

   programmername   - Programmer name
   projectname      - Project name
   detail           - Generate user details


IV. To create a new IBSYS load tape

1. Copy the current load tape into a directory:

   $ cp ../images/ASYS1.BIN ./

2. Split it apart:

   $ bsplit ASYS1.BIN asys1

   This will create files for all the parts as asys1_fffrrr.bin
   Where fff is the file number and rrr is the record number.

3. Copy in the new IBSYS nucleus and convert to scatter load:

   $ obj2bin ../ibsysdir/ibsys.obj asys1_001002.bin
   $ obj2bin -s 1 ../ibsysdir/ibsys.obj asys1_001003.bin

   This will take the IBSYS object file from asm7090 and convert it into
   the tape file. The IBSYS nucleus is ALWAYS file 001 record 002 of the
   load tape. The second obj2bin copies in the SYSDMP which matches the
   IBSYS configuration.

4. Glue the parts back together:

   $ cat asys1_*.bin >ASYS1.BIN

5. The new image is now ready to be loaded.

There are two shell scripts, update1.sh and update8.sh, that updates various
parts of the IBSYS tapes. To use the scripts you must have split apart the
tape prior to execution. Also, If want to use the check option you must have
split it apart under a different root. For example:

1. Split apart the ASYS1 tape:

   bsplit ASYS1.BIN asys1
   bsplit ASYS1.BIN Asys1

2. Update FORTRAN II compiler and check it:

   update1.sh fortII check

3. Glue it back together:

   $ cat asys1_*.bin >ASYS1.BIN

