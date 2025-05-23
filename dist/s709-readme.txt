Version: 2.4.4
Date: 2025/05/20


I. Introduction

s709 is an emulator for the IBM 709/709x family of computers. The sources also
contain utility programs for reading and writing files, both tape and card 
images. Changes have been made to these utilities to run in the IBSYS mode as
default. DASD devices, disk and drum, are supported for both IBSYS and CTSS.

To obtain CTSS information consult the README's in the appropriate CTSS 
distributions.


II. Build s709

Lunix/Unix:

$ make

The make attempts to figure out which system to make for using uname.

Windows:

$ nmake nt


III. To run s709

The command line for s709 is as follows:

$ s709 [options] [I/O units]

Where the options are:

    -a           - Use alternate BCD encoding.
    -CN          - Number of channels on system, default = 4.
    -cCOMMANDS   - Command file.
    -mCPU        - CPU mode, CPU = 709, 7090, 7094 or CTSS, default = 7090.
    -p           - Turn off panel mode.
    -wNN         - Window size for panel, default = 25.

The I/O units are defined as:

   r=reader          - Card Reader, CBN file.
   u=punch           - Card Punch, CBN file.
   p[c]=printer      - Line Printer, BCD file.
   CU[ars]=tapefile  - Channel/Unit tapefile, BIN or BCD file.
   CcNN=port[:model] - 7750 Channel, NN = number of lines, port = telnet port,
                       model = Terminal model (default = KSR-37).
   CdAM=diskfile     - Channel/Access/Module diskfile.
   ChAM=drumfile     - Channel/Access/Module High speed 7289 drumfile.
   CnAM=drumfile     - Channel/Access/Module Next 7320 drumfile.

Where:

   C             - Device channel A-H.
   U             - Unit number 1-10.
   A             - Device access number 0-4.
   M             - Device module number 0-9.
   a             - Optional Alternate BCD encoding.
   c             - Optional Printer clock.
   r             - Optional Read only specification.
   s             - Optional simh tape format specification.

For DASD devices the access value is normally zero for the assignment as the
number of access arms is read from the container file on open. It is non-zero
when the device numbering is assigned in a non-sequential manner and this value 
specifies the beginning module number for this device.

For COMM devices the supported terminal models are:

   KSR-33
   KSR-35
   KSR-37

The COMM adapter maps the CTRL-C character to generate the CTSS "INT" interrupt
character and the CTRL-\ to generate the CTSS "QUIT" interrupt character.
The CTRL-U character purges the character queue of entered characters.
The DELETE or BACKSPACE characters delete one character from the queue.

For tape devices real tape drives under Unix/Linux are supported, eg. /dev/nst0.


IV. s709 Commands

The following is a list of the available commands for s709:

   a                  - toggle Automatic mode.
   b [addr]           - set/clear Breakpoint.
   c                  - Clear memory and reset cpu.
   da                 - Display AC.
   di                 - Display SI.
   dk                 - Display keys.
   dl                 - Display SL.
   dm                 - Display MQ.
   dn                 - Display next storage location.
   dp                 - Display PC.
   dr                 - Display SR.
   ds addr            - Display storage location.
   dx#                - Display index register.
   dw                 - Display SSW.
   D start end [file] - Dump memory [to file].
   ea val             - Enter AC.
   ei val             - Enter SI.
   ek val             - Enter keys.
   em val             - Enter MQ.
   en val             - Enter next storage location.
   ep val             - Enter PC.
   er val             - Enter SR.
   es addr val        - Enter storage location.
   ex# val            - Enter index register.
   h                  - Help.
   lc                 - Load Cards.
   ld CTAM            - Load DASD. T = type: d = Disk, n = Next (Drum).
   lf[n] [addr] file  - Load File, n specifies Not to start program.
   lt [CU]            - Load Tape, default A1.
   m device=file      - Mount file on device.
   p [windowsize]     - toggle Panel mode.
   q                  - Quit.
   r                  - Reset cpu.
   sc                 - Step one Cycle.
   ss                 - Single Step.
   st                 - STart.
   sw#                - toggle SSW.
   t                  - print Trace.
   tc                 - Close Trace file.
   tf[u] file         - Trace instructions to File, u specifies CTSS User mode.
   tl                 - print Long format trace.
   u device           - Unmount device.
   w [addr]           - set/clear Watchpoint.


V. Running IBSYS using SYSIN1 tape

Use the runibsys shell script, or batch file for Windows, to run IBSYS using
tape as the input. This script tries to encapsulate the entire process of
running the job(s). The command is:

$ runibsys inputjob outputlisting

Where the arguments to the runibsys command are:

   inputjob      - The JOB to be run starting with the JOB card.
   outputlisting - The resultant output listing converted to ASCII.

After entering the runibsys command the input job will be copied into the
SYSIN1 tape image with IBSYS control cards before and after the job. The 
emulator will startup reading the ibsys.cmd file for execution commands.

After the job(s) run the SYSOU1 tape will be converted and written into
the output listing file.


VI. Running IBSYS using Card input

Use the runibsysc shell script to run IBSYS using cards as the input. This
script tries to encapsulate the entire process of running the job(s). The
command is:

$ runibsysc inputjob outputlisting

Where the arguments to the runibsys command are:

   inputjob      - The JOB to be run starting with the JOB card.
   outputlisting - The resultant output listing converted to ASCII.

After entering the runibsys command the input job will be copied into the
SYSIN1 tape image with IBSYS control cards before and after the job. The 
emulator will startup reading the ibsysc.cmd file for execution commands.

After the job(s) run the SYSOU1 tape will be converted and written into
the output listing file.


VII. Running IBSYS using two tape Channels

Use the runibsys2 shell script to run IBSYS using tape as the input. This
script tries to encapsulate the entire process of running the job(s). The
command is:

$ runibsys2 inputjob outputlisting

Where the arguments to the runibsys2 command are:

   inputjob      - The JOB to be run starting with the JOB card.
   outputlisting - The resultant output listing converted to ASCII.

After entering the runibsys2 command the input job will be copied into the
SYSIN1 tape image with IBSYS control cards before and after the job. The 
emulator will startup reading the ibsys.cmd file for execution commands.

After the job(s) run the SYSOU1 tape will be converted and written into
the output listing file.


VIII. Running Disk IBSYS using two tape Channels

Use the runibsysd shell script to run Disk IBSYS using tape as the input. This
script tries to encapsulate the entire process of running the job(s). The
command is:

$ runibsysd inputjob outputlisting

Where the arguments to the runibsysd command are:

   inputjob      - The JOB to be run starting with the JOB card.
   outputlisting - The resultant output listing converted to ASCII.

After entering the runibsysd command the input job will be copied into the
SYSIN1 tape image with IBSYS control cards before and after the job. The 
emulator will startup reading the ibsysd.cmd file for execution commands.

After the job(s) run the SYSOU1 tape will be converted and written into
the output listing file.

See Appendix A to build the bootable disk image.


IX. Running a Lisp program

Use the runlisp shell script to run a Lisp program. The command is:

$ runlisp inputjob outputlisting

Where the arguments to the runlisp command are:

   inputjob      - The Lisp job to be run.
   outputlisting - The resultant output listing converted to ASCII.

There are two example Lisp jobs that may be run with the runlisp command. They
are:

   fact.lsp      - Factorial program.
   ffact.lsp     - Factorial program, floating point.
   propcal.lsp   - Propositional Calculus program.


X. Sample IBSYS Jobs

dfmt1.job          - Disk Format test
dfmt.job           - Disk Format test
dfmtn.job          - Drum Format test
disk_edit2.job     - Disk System build, requires PR130-1 source tape
dkbld.job          - Disk format and copy IBSYS
editor.job         - COBOL source editor
hello.job          - COBOL Hello World
ibedt2.job         - SYSLB2 IBEDT
ibedt.job          - SYSLB1 IBEDT
laplace.job        - FORTRAN Laplace Transform
primesII.job       - FORTRAN-II Prime numbers
primes.job         - FORTRAN Prime numbers
testfap.job        - FAP Assembler test
test.job           - JOB sequence test, PRIMES, HELLO, LAPLACE and MAP
testall.job        - JOB sequence test, PRIMES (II & IV), HELLO, LAPLACE, MAP 
                     and FAP.
testmap.job        - MAP Assembler test
units.job          - Prints device units


XI. Known problems/issues/notes

1. When attaching real tape devices the tape drives must be loaded and online
   or the open will fail.

2. When running in 709 or 7090 mode the 7094 and CTSS instructions are caught 
   and an error message is issued and the simulation is halted. The multiple
   tag (EMTM/LMTM) and DLD (double load) instructions are treated as NOP (like
   a real 709/7090). This is to allow the IBJOB processor to determine which
   CPU mode it is running on. The FORTRAN IV runtime on the IBSYS tape is 
   configured for the 7094 model and will fail on the 709/7090 models.

Appendix A: Build Disk IBSYS system image.

This procedure uses the mkdasd utility in the utils-1.1.11.tar.gz distribution.

1. Create the disk image files:

   $ mkdasd -d 1301-1 IBSYS1.DSK
   $ mkdasd -d 1301-1 IBSYS2.DSK
   $ mkdasd -d 1302-1 IBSYS3.DSK

2. Run the IBSYS job to format and copy IBSYS:

   $ runibsys2d dkbld.job dkbld.lst 

   Enter "st" at each operator request. This procedure only formats the 
   dd00 (IBSYS1.DSK) drive.

3. You are now ready to test run the Disk IBSYS using the runibsysd command:

   $ runibsysd test.job test.lst 

