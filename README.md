# CTSS on s709 quickstart

Via this repo, you can get [CTSS](https://timereshared.com/ctss/)
running on the s709 emulator. Nearly all of the functionality here is
provided by three excellent open source packages created by [Dave
Pitts](https://cozx.com/dpitts/ibm7090.html):

* The [s709](dist/s709-readme.txt) emulator for the IBM 7094
* The reconstructed [CTSS kit](dist/ctss-kit-readme.txt)
* [Utilities](dist/utilities-readme.txt) for managing input and output files

This repo provides some shell scripts that automate much of the setup
process.

### s709 or simh?

I have made two quickstart repos for CTSS, this one is using the s709
emulator and the other one is using
[simh](https://github.com/timereshared/ctss-simh-quickstart). Which
one should you use?

For beginners I would recommend starting with this one, as it has a
complete set of tools to upload and download files easily. simh is a
good choice if you have used it before for other emulators, and it has
a more powerful configuration and automation language. Try both and
see which you prefer!

## Prerequisites

You will need a Unix-like environment capable of running shell
scripts, make, a C compiler etc.

You will also need the `telnet` command line program or a GUI telnet
client. The command line program can be installed by `sudo apt install
telnet` on Debian/Ubuntu or `brew install telnet` on MacOS.

## Build the system

1. Set up the environment, make the emulator and create disk files by
   running each of these commands in order:

```
source env.sh
make-binaries
make-disks
```

2. The next two commands will prompt you to press Enter a number of
times and then `q` to quit.

```
format-disks
install-disk-loader
```

3. Complete the installation.

```
installctss
```

CTSS is now installed on the disk and drum files under `dasd/`.

## Running CTSS

Ensure you have set up the environment by typing `source env.sh`.

Then start CTSS by typing `runctss`

In a separate window, start your telnet client and connect to
localhost port 7094. For the command line client you can type `telnet 0 7094`.

Log in there by typing `login guest` and giving the password `guest`
at the next prompt.

You can now run CTSS commands - for example, try typing `listf` to get
a directory listing.

When you are finished, type `logout`.

## Shutting down CTSS

You will need to switch back to the *main emulator window* you started
earlier - this cannot be done from the telnet session.

Execute the following, pressing Enter after each non Control-C line.

* Press Control-C
* Type `ek 40017`
* Type `st`
* Press Control-C
* Type `ek 0`
* Type `st`
* Press Control-C
* Type `ek 40032`
* Type `st`
* Type `q` and Enter to exit.

## Learning more

* Look at the three READMEs linked at the top of this page to find out
  more about s709 and the CTSS kit.
* Read the [CTSS Programmer's Guide](https://bitsavers.org/pdf/mit/ctss/CTSS_ProgrammersGuide_Dec69.pdf) (PDF) to learn more about CTSS
* See my blog post series on CTSS at https://timereshared.com/ctss/

## License

This repo is composed of two parts, both under the MIT license.

The s709 emulator, ctss-kit and utilities under `dist/` are from Dave
Pitts' [IBM 7090/7094 page](https://cozx.com/dpitts/ibm7090.html),
based on previous work on s709 by Paul Pierce; see
[LICENSE.txt](dist/LICENSE.txt).

Rupert Lane adapted this and added some additional shell scripts in
`scripts/`; see [LICENSE.txt](LICENSE.txt).
