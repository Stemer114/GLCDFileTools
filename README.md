GLCDFileTools
=============

GLCD (graphic LCD) file tools for supporting microcontroller development

Developed for STM32 with arm-gcc linux toolchain

Should work for other uCs as well, when you're coding in C.

When developing a microcontoller application with a graphic LCD, 
but no mass storage, it is often easiest to import image files as 
c code (c array with hex data).

When starting developing STM32 with linux arm-gcc toolchain
I was surprised to discover there are no easy to use tools
available under linux which would allow me to convert bmps
to a C data structure. At least I have found none which 
were easy to use.

(There are several windows tools available, though).

The tools use perl, because that's what I know, works
at least on every linux system, and the installation
is easy via CPAN shell.


TOOL OVERVIEW
=============

 `bin2hex.pl` - convert a binary file into a c array

 `bindump.pl` - display a hexdump of a binary file

 `bmpinfo.pl` - display information on a bmp file



INSTALLATION
============

copy or clone the repo to a location of your choice.

The following perl modules are required:

```
File::Slurp
Data::Hexdumper
Image::BMP
```


Installation of these modules takes only a few seconds using the CPAN shell
which is part of most perl installations:

```
 perl -MCPAN -e shell (opens CPAN shell)
 
 install File::Slurp
 install Data::Hexdumper
 install Image::BMP

 exit
```

Finally, make the perl scripts executable, if required (chmod u+x __.pl)


USAGE: bin2hex.pl
=================

`bin2hex.pl filename.bmp test > test.c`

Will read in the binary file test.bmp and create a C file test.c
which will contain a C array named test with a hexdump of the contents
of test.bmp and a C structure named test_bmp with a reference to the 
array and the number of (relevant) bytes of the array.

You can pass bin2hex.pl any binary file you like, it is not especially
designed for bmp files.

The resulting C-file follows the layout of the C files for the lib
stm32_ub_graphic by admin_ub (http://mikrocontroller.bplaced.net/wordpress/?page_id=744)
and can be readily used with this lib.

If you require a different layout for your C file, you can easily adapt the 
here documents in the script or the resulting C file.

The script does no size or range checks and has only been tested with 
relatively small bmp files.

Generally, it should work with larger files as well, e.g. ogg files or similiar.


USAGE: bindump.pl
=================

` ./bindump.pl test.bmp`

Will print a 16 column hexdump with leading address column and trailing ASCII
column.

Useful for analysing bmp files and for debugging purposes.


USAGE: bmpinfo.pl
=================

```
user@host:~/utilities$ ./bmpinfo.pl minimize.bmp 
BMP: minimize.bmp
Image: 24/16777216 colors. Geometry: 16x14 672 [comp: 0]
Reading image data - [16 x 14 x 24]...
:nnnnnnnnnnnnnn:
:nnnnnnnnnnnnnn:
:LLLLLLLLLLLLLL:
:              :
:              :
:              :
:      X0      :
:     Xtt0     :
:    Xtttt0    :
:   Xtttttt0   :
:   XXXtt000   :
:     Xtt0     :
:0000$Xtt0$0000:
::::::Xtt0::::::

FileSize: 726 
DataOffset: 54 
HeaderSize: 40 
Resolution: 16 x 14 (W x H)
Planes: 1 
BitCount: 24 
ColorBytes: 3 
Compression: 0 
ImageSize: 672 
XpixelsPerM: 0 
YpixelsPerM: 0 
ColorsUsed: 16777216 
ColorsImportant: 0 
```

Will display both a simplified ASCII representation of the bmp file
and file information. Most LCD libraries for uCs require 24bpp bmps
so you can check you bmp if it fits.



AUTHOR, COPYRIGHT and LICENCE
=============================

Copyright 2014 Stemer114 <stemer114@gmail.com>

This software is free-as-in-speech software, and may be used, distributed, and modified 
under the terms of the GNU General Public Licence version 2. The full text of the 
licence can be found in the file LICENSE.


THANKS TO
=========

admin_ub from http://mikrocontroller.bplaced.net/wordpress/?page_id=744 for his 
excellent STM32F4 libraries and infos.

Elia from http://eliaselectronics.com/stm32f4-tutorials/ for the - IMO - best working and easiest
to use tutorial on setting up a gcc-based toolchain for STM32 under linux - WITHOUT
having to use Eclipse for something as simple as coding C for a microcontroller.


