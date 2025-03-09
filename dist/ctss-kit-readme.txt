2025/02/12 CTSS Install kit

This Kit archive contains the following tapes:

clock.tap	- Clock diagnostic.
cmfl01.tap	- CMFL01 boot files.
com1.tap        - com1 programs.
com2.tap        - com2 programs.
com3.tap	- com3 programs and configuration files.
com4.tap	- com4 programs.
com5.tap	- com5 programs.
comdata.tap     - Common data files.
comlinks.tap    - Common links files.
ctss.tap	- CTSS kernel. 
dg7750.tap	- 7750 diagnostic.
dsetup.tap	- Disk/Drum setup program.
dskedt.tap      - Disk Editor program.
extract.tap     - Extracts files from CTSS program.
fibmon.tap      - FIBMON data files.
guest.tap       - GUEST data files.
hsdt1a.tap      - High speed Drum diagnostic.
lisp.tap        - Lisp program.
loader.tap	- System loader.
progs.tap       - Lisp test programs.
quotas.tap      - User quotas file.
salv4.tap       - Standalone Salvager.
setup.tap	- The CTSS setup program.
sysdev.tap	- System development files.
util.tap        - ADMIN utilities.

The command scripts:

adduserctss      - Add user to CTSS.
cleanupctss      - CTSS Install cleanup script.
deluserctss      - Delete user from CTSS.
diagctss         - Diagnostic mode script.
dskedtctss       - Run Disk Editor script.
extractctss      - Extract file script.
installctss      - Install CTSS script.
plotctss         - Extract plotter tape and convert.
reportuserctss   - Report on CTSS users.
runctss          - Run CTSS script.
salvagectss      - Run the Salvager.
setupctss        - Setup file script.

Also the following files:

README.txt       - This file.
Makefile         - Kit Makefile.

diagctss.cmd     - Diagnostic mode command file.
dskedtctss.cmd   - Disk Editor command file.
runctss.cmd      - Run mode command file.
utilctss.cmd     - Utility mode command file.
fmtchk.cmd       - Format, check write MFD DASD command file.
fmt.cmd          - Format and write MFD DASD command file.
mfd.cmd          - Write MFD DASD command file.
loader.cmd       - Loader command file.
salvagectss.cmd  - Salvager command file.

Here's a link to the CTSS Programmer's Guide:

http://www.bitsavers.org/pdf/mit/ctss/CTSS_ProgrammersGuide_Dec69.pdf



I. To install the kit:

1. Build the components needed, the utilities and s709.

$ tar xzf utils-1.1.12.tar.gz
$ cd utils
$ make
$ make install

$ tar xzf s709-2.3.5.tar.gz
$ cd s709-2.3.5
$ make


2. Edit the command scripts and change the TAPE and DASD variables to point to
your appropriate directories.


3. Edit the Makefile and change the TAPEDIR and S709DIR variables to your 
appropriate directories. Run make to copy the tapes and scripts:

$ make install


4. Make the DASD images:

$ mkdir ${YOURDASDDIR}
$ cd ${YOURDASDDIR}
$ mkdasd -d 1302-2 DISK1.BIN
$ mkdasd -d 1302-2 DISK2.BIN
$ mkdasd -d 7320 DRUM1.BIN
$ mkdasd -d 7289 DRUM2.BIN
$ mkdasd -d 7289 DRUM3.BIN


5. Format the DASD:

$ cd s709-2.3.5
$ diagctss ${YOURTAPEDIR}/dsetup.tap fmt.cmd 
IBM 7094-CTSS Simulator 2.3.5

.st

.st
* JUST FORMAT
DSKFMT 0 1 250
DSKFMT 1 1 250
DSKFMT 2 1 250
DSKFMT 3 1 250
DSKFMT 4 1 250
DSKFMT 5 1 250
DSKFMT 6 1 250
DSKFMT 7 1 250
DRMFMT 8 1 1
DSKREC 0 0 10000
DSKREC 1 0 10000
DSKREC 2 0 10000
DSKREC 3 0 10000
DSKREC 4 0 10000
DSKREC 5 0 10000
DSKREC 6 0 10000
DSKREC 7 0 10000
DRMREC 8 0 400
SETMFD 1 8
QUIT

.q


6. Install disk loader:

$ diagctss ${YOURTAPEDIR}/dsetup.tap loader.cmd "" a2=${YOURTAPEDIR}/loader.tap
IBM 7094-CTSS Simulator 2.3.5

.st                                                      

.st                                                      
* SET UP THE LOADER                                                     
LOADER 0                                                                
 SET SWITCHES IN '65K' MODE AND PRESS START.                            

.st                                                      
                                                                        
 SET SWITCHES IN '32K' MODE AND PRESS START.                            

.st                                                      
                                                                        
QUIT                                                                    

.q           


7. To install the software on the disks:

$ cd s709-2.3.5
$ installctss
IBM 7094-CTSS Simulator 2.3.5

 ADDING UFD  M1416 CMFL02
 ADDING UFD  M1416 CMFL04
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 CMFL02
 COPY TO IMAGE FILE ADMN8A TSSDC.
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 CMFL02
 COPY TO IMAGE FILE    FIB TSSDC.
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 CMFL02                                             
 COPY TO IMAGE FILE MADTRN TSSDC.                                       
 ...
 DISK INITIALIZATION COMPLETE.                                          
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 CMFL02
 COPY TO IMAGE FILE   MAIL TSSDC.
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 CMFL02
 COPY TO IMAGE FILE   LISP TSSDC.
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 CMFL02
 ADDING LINK LOADGO TSSDC. TO  M1416 CMFL02   LOAD TSSDC.
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 CMFL02
 COPY TO TEXT FILE COMS00  SYMTB
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  C0056 DAEMON
 ADDING QUOTA TO  C0056 DAEMON DRUM 000000 DISK 004000 TAPE 004000
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  C0056 FIBMON
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 ADMIN
 ADDING LINK UACCNT TIMACC TO  M1416 CMFL02 UACCNT TIMACC
 COPY TO IMAGE FILE SUMARY  SAVED
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5
 ATTACHING TO  M1416 CMFL01                                             
 COPY TO BSS FILE ADPI8A    BSS                                         
 ...
 DISK INITIALIZATION COMPLETE.                                          
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.                              

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 GUEST
 COPY TO TEXT FILE HELLO    MAD
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

IBM 7094-CTSS Simulator 2.3.5

 ATTACHING TO  M1416 GUEST
 COPY TO TEXT FILE   FACT   LISP
 ...
 DISK INITIALIZATION COMPLETE.
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.

 ATTACHING TO  M1416 SYSDEV                                             
 COPY TO TEXT FILE   LOAD    FAP                                        
 ...
 DISK INITIALIZATION COMPLETE.                                          
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE.    


8. Make a backup of your dasd images:

$ cd ${YOURDISKDIR}
$ cp DRUM1.BIN ${YOURBACKUPDIR}/DRUM1.BIN
$ cp DISK1.BIN ${YOURBACKUPDIR}/DISK1.BIN
$ cp DISK2.BIN ${YOURBACKUPDIR}/DISK2.BIN

These allow you to restore images in case of a crash.


II. To run CTSS:

1. Start CTSS:

$ cd s709-2.3.5
$ runctss 
IBM 7094-CTSS Simulator 2.3.5

MIT8C0--THE DATE AND TIME ARE MMDDYYHHMM.T
 C0056 99995 LOGGED IN  MM/DD/YY HHMM.T FROM (FIB)    USERS= 01 


At this point s709 is running the CTSS kernel. The system is booted from the
CMFL01 disk images.


2. In another window:

The GUEST password is "SYSTEM".

$ telnet localhost 2023
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
s709 2.3.5 COMM tty0 (KSR-37) from 127.0.0.1

MITC80 : 1 USERS AT MM/DD/YY HHMM.T, MAX = 30
READY.

login m1416 guest
W HHMM.T
Password
 M1416     5 LOGGED IN  MM/DD/YY HHMM.T FROM 100000
 HOME FILE DIRECTORY IS M1416 GUEST

THIS IS A RECONSTRUCTED CTSS SYSTEM.
VERSION V.R.M
BUILT: MM/DD/YY HHMM.0

 CTSS BEING USED IS: MITC80
R .083+.000

listf
W HHMM.T

 HELLO    MAD 000     1 MM/DD/YY


R .016+.033

print hello mad
W HHMM.T

 HELLO    MAD      MM/DD  HHMM.T

            VECTOR VALUES HELLO = $12H HELLO WORLD*$
            PRINT FORMAT HELLO
            END OF PROGRAM
R .016+.016

mad hello
W HHMM.T
LENGTH 00020.  TV SIZE 00003.  ENTRY 00011
R .033+.033

loadgo hello
W HHMM.T
EXECUTION.
 HELLO WORLD
  EXIT CALLED. PM MAY BE TAKEN.
R .483+.016

logout
W HHMM.T
 M1416     5 LOGGED OUT MM/DD/YY HHMM.T FROM 100000
 TOTAL TIME USED =    .0 MIN.
Connection closed by foreign host.


3. To update the YEAR in the installed CTSS system:

The SYSDEV password is "SYSTEM".

$ telnet localhost 2023
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
s709 2.4.3 COMM tty0 (KSR-37) from 127.0.0.1

MIT8C0: 1 USER AT MM/DD/YY 1520.3, MAX = 30
READY.

login sysdev
W 1520.4
Password
 M1416     6 LOGGED IN  MM/DD/YY 1520.5 FROM 700000
 HOME FILE DIRECTORY IS M1416 SYSDEV

THIS IS A RECONSTRUCTED CTSS SYSTEM.
VERSION V.R.M
BUILT: MM/DD/YY HHMM.0

 CTSS BEING USED IS: MIT8C0
R .050+.000

runcom mkyear
W 1520.7
MKYEAR STARTED
MACR0008     M     CALL   MACRON  NAME,LIST     SUBROUTINE CALL MACRO
MACR0054     M     SAVE   MACRO   ID,LIST       SAVE BASIC MACHINE CONDITIONS
EQU00229     M     TYPE   MACRO   MESG,LOC,N    TYPE COMMENT TO CURRENT USER
EQU00239     M     TYPEA  MACRO   MESG,LOC,N    TYPE COMMENT TO USER W/O C.R.
EQU00249     M     TYPEF  MACRO   MESG,LOC,N    TYPE COMMENT IN FULL MODE
     COMMON BREAK  72127
     LENGTH   764
MKYEAR HAS BEEN RUN
R 1.316+.283

logout
W 1521.5
 M1416     6 LOGGED OUT MM/DD/YY 1521.5 FROM 700000
 TOTAL TIME USED =    .0 MIN.
Connection closed by foreign host.

For the new year to take effect the CTSS system must be shutdown and rebooted.


4. To install the HUGE loaded (if needed):

The SYSDEV password is "SYSTEM".

telnet localhost 2023
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
s709 2.4.3 COMM tty0 (KSR-37) from 127.0.0.1

MIT8C0: 1 USER AT 01/18/25 1535.9, MAX = 30
READY.

login sysdev
W 1536.0
Password
 M1416     6 LOGGED IN  MM/DD/YY 1536.2 FROM 700000
 HOME FILE DIRECTORY IS M1416 SYSDEV

THIS IS A RECONSTRUCTED CTSS SYSTEM.
VERSION V.R.M
BUILT: MM/DD/YY HHMM.0
BUILT: MM/SS/YY HHMM.0

 CTSS BEING USED IS: MIT8C0
R .050+.000

runcom mkhuge
W 1536.4
MKHUGE STARTED
     LENGTH  6432
MKHUGE HAS BEEN RUN
R 1.200+.383

logout
W 1536.7
 M1416     6 LOGGED OUT 01/18/25 1536.7 FROM 700000
 TOTAL TIME USED =    .0 MIN.
Connection closed by foreign host.

The huge loader is now available as a standard CTSS command 'L'.


5. To cleanly shutdown CTSS (You can't just kill it):

In the s709 window enter a CTRL-C and you will get a prompt:

CTRL-C

.ek 40017

.st
KEYS READ. 000000040017  AT  HHMM.T                                    
 C0056 99995 LOGGED OUT MM/DD/YY HHMM.T FROM (FIB)    USERS= 00       TOTAL TIME USED =    .0 MIN.                                              
 ...
 ALL FOREGROUND USERS LOGGED OUT. DO NOT CLEAR CORE.

CTRL-C

.ek 0

.st
KEYS 000000000000  AT  HHMM.T

CTRL-C

.ek 40032

.st
 KEYS READ. 000000040032  AT  HHMM.T                                    
 CTSS IS FINISHED. YOU MAY NOW CLEAR CORE. 

.q


III. CTSS Salvager

If in the event of a crash or abnormal termination of CTSS and CTSS will
not reboot the Salvager must be run.

To run the CTSS Salvager:

$ salvagectss
IBM 7094-CTSS Simulator 2.3.5

.st                                                      
 WORKING ON  M1416CMFL01                                                
 WORKING ON  M1416CMFL02   
 ...

.q


IV. CTSS Disk Editor (DSKEDT)

The Disk Editor allows for the processing of PRINT, punch (BPUNCH, DPUNCH or
7PUNCH) and CARRY output requests that are queued using RQUEST command. The 
PLOT RQUEST command is not suppored in the current DSKEDT version.

1. To process RQUEST queued requests enter the following to run DSKEDT:

$ dskedtctss
IBM 7094-CTSS Simulator 2.3.5
.st                                                      


RQUEST FILES                                                            
       PRINT RQUEST BCD CARDRQ BCD                                 M1416     4
       ...
FINISHED RQUEST FILES. SWT 4-DWN-TAPE A2                                
                  SWT 4 -UP- QUIT                                       
 PRESS START TO CONTINUE.                                               
.st                                                      


      FINISHED INPUT EDIT.                                              
 EXIT CALLED                                                            
.q   

At this point several tape files will have been created to contain the output.

The PRINT requests are written to the tape named "sysprint.tap". To post 
process into a printable (editable) file enter:

$ bcd2txt -p sysprint.bcd <YOUR_OUTPUT_LISTING>

The Punch requests (BPUNCH, DPUNCH or 7PUNCH) are written to tapes named 
"syspunchid.tap" (the ID tape) and "syspunch.bcd" (the Data tape). To post
process the tapes enter:

$ punchctss syspunchid.tap syspunch.tap <YOUR_OUTPUT_DIRECTORY>

This will extract the individual punch files into your specified directory.

The CARRY requests are written to the tape named "syscarry.tap".


2. To process a CARRY tape as input enter:

$ dskedtctss "" "" a2=<YOUR_CARRY_TAPE>
IBM 7094-CTSS Simulator 2.3.5
.sw4                                                     

.st                                                      


AM STARTING TAPE A2. RESET SWT 4.                                       
SWT 1 - READ ONLINE                                                     
 PRESS START TO CONTINUE.                                               
.sw4                                                     

.st                                                      


      INPUT, M1416       PITTS      CARDRQ         FAP                  
      ...
      STOP  -END OF CARRY TAPE                                          
SWT 2 -UP- CONTINUE                                                     
SWT 2 -DWN- QUIT                                                        
SWT 4 -DWN- REQUEST FILE                                                
 PRESS START TO CONTINUE.                                               
.sw2                                                     

.st                                                      


      FINISHED INPUT EDIT.                                              
 EXIT CALLED                                                            
.q                                                      


V. Plotter tape support

Since the DSKEDT program does not support the PLOT RQUEST command the "plotctss"
command script has been added. The script extracts the plotter tape file from
CTSS and runs it through the plot converter program, plotcvt, to build a
displayable PostScript file. The plotter library, PLIBE, always creates the
plot file with the name1 as ".PLOT." and the name2 as a user specified integer.
So, to run the "plotctss" command enter:

$ plotctss name2 projname progname outputfile [cvtopts]

Where:

   name2     - Is the name2 part of the file name.
   projname  - Project name.
   progname  - Programmer name.
   filename  - The converted PostScript file.
   cvtopts   - plotcvt program options.
      -p N         - Pixels per inch. Default = 300.
      -r           - Rotate the plot 90 degrees.

For example:

$ plotctss 1 m1416 guest plotter.ps

or

$ plotctss 1 m1416 guest plotter.ps "-r -p 200"

The pre-converted output plotter tape is left in the file "sysplot.bcd". This 
allows for re-running the plotcvt without doing another extraction.


VI. File extractor

This script, extractctss, allows for the extraction of files from CTSS disks. 
It can run in either a "batch" mode using a control file or in a single file
mode. The extract program actually generates a tape image, "sysout.bcd", that
can be post processed depending on its type. The supported types are:

   B   - BSS file.
   L   - Listing file.
   P   - Plot file.
   T   - Text file. 


1. Batch extraction

This mode uses a control file that specifies the file names, extraction type,
project name and programmer name. The records have five fields that are six
characters in length. The name1, name2, type and project name are all right
justified. The programmer name field is left justified.

The following example extracts the listing file for the MAD compiler listing of
the CQA1 program in the GUEST directory:

  CQA1   BCD     L M1416GUEST 

The control file may contain any number of records of files to be processed and
all control records are converted to upper case. The output tape will have an
EOF record between each extracted file and two EOF's at the end. Since there
may be intermixed types no post processing is performed.

To run:

$ extractctss control.file [output.file]

Where:

   control.file   - Is the file containing the extraction records.
   output.file    - An optional file to which the sysout.bcd is copied.


2. Single file extraction

This mode extracts a single file and the type, file name, project name and
programmer name arguments are on the command line. The arguments are folded to
upper case and properly justified.

To run:

$ extractctss type name1 name2 project programmer [output.file]

Where:

   type           - Is a type as specified above.
   name1          - The name1 component.
   name2          - The name2 component (extension).
   project        - Project name.
   programmer     - Programmer name.
   output.file    - An optional file to which the sysout.bcd is copied.

The Listing, Plotter and Text types are post processed if the output.file is
specified. The BSS type is just copied.

The following example extracts the listing file for the MAD compiler listing of
the CQA1 program in the GUEST directory:

$ extractctss l cqa1 bcd m1416 guest cqa1.lst

The resulting file, cqa1.lst, has been converted to native text and carriage
control characters have been mapped.

The following example extracts the MAD source file for the CQA1 program in the
GUEST directory:

$ extractctss t cqa1 mad m1416 guest cqa1.mad

The resulting file, cqa1.mad, has been converted to native text format.


VII. CTSS Lisp

The Lisp program as supplied will not run the test programs without some setup. 
Lisp is designed to be user extensible and to use with the test programs we 
have to load some defintions. So, we execute:

lisp define
W 1546.9
06978
 VALUE
 NIL
 VALUE
 DEFLIST
 VALUE
 DEFINE
 VALUE
 (MEMBER PRINTPROP FLAG1 FLAG REM1FLAG REMFLAG TRACE UNTRACE
 CSET OPDEFINE)
 VALUE
 (CONC CSETQ)
R .100+.083


This reads the definitions into the Lisp program. Now we save a new copy for
our use:

save mylisp
W 1547.0
R .000+.116

This new program, mylisp, now has our new definitions. Now we can run the test
programs:

mylisp fact
W 1547.1
 VALUE
 (FACTORIAL)
 VALUE
 3628800
R .000+.116

The test programs are:

   fact lisp     - Factorial program.
   ffact lisp    - Factorial program, floating point.
   procal lisp   - Propositional Calculus program.


VIII. Adding users to CTSS

There is no "standard" way of adding users to CTSS; so, I added this shell
script to take care of this.  The CTSS system must be shutdown as we are
tweaking it from "outside". To run:

   $ adduserctss [options] programmername programmernumber password

Where options are:

   -c "comment"       - Comment for user (full name, etc).
   -p projectname     - Project name for the user, default M1416.
   -d diskquota       - Disk quota for user, default 4000 blocks.
   -r drumquota       - Drum quota for user, default 0 blocks.
   -t tapequota       - Tape quota for user, default 0 blocks.

The programmer name, project name and password are limited to 6 characters.
The comment information is placed in an unused field in the TIMUSD file.

Example:

   $ adduserctss -c "Bob Dobbs" -d 3000 dobbs 6 genius


IX. Deleting users from CTSS

There is no "standard" way of deleting users from CTSS; so, I added this shell
script to take care of this.  The CTSS system must be shutdown as we are
tweaking it from "outside". To run:

   $ deluserctss [options] programmername

Where options are:

   -p projectname     - Project name for the user, default M1416.

The programmer name and project name are limited to 6 characters.

Example:

   $ deluserctss dobbs 


X. Rporting on users in CTSS

This script generate reports of users in the CTSS system.  The CTSS system must
be shutdown as we are accessing it from "outside". To run:

   $ reportuserctss [options] [programmername]

Where options are:

   -a                 - Report ALL users in ALL projects.
   -d                 - Report user details.
   -p projectname     - Project name for the user, default M1416.

The programmer name and project name are limited to 6 characters. If the 
programmer name is not specified then a report on all users in the project is
generated.

Example:

   $ reportuserctss dobbs 

To report on all users in the specified project:

   $ reportuserctss -p C0056


Questions/Comments:
e-mail: dpitts@cozx.com
