GLCDFileTools
=============

GLCD (graphic LCD) file tools for supporting microcontroller development

Developed for STM32 with arm-gcc linux toolchain

Should work for other uCs as well, when you're coding in C.

When developing a microcontoller application with a graphic LCD, 
but no mass storage, it is often easiest to import image files as 
c code (c array with hex data).

`bin2hex` converts a binary file into a C file which can be 
included into your project. `bindump`and `bmpinfo` are 
utility functions useful for development and debugging.

There are lots of these tools available but I wanted 
my own. The output is readily useable for the ub_lib
graphic LCD library (see below).

The tools use perl, because that's what I know, works
at least on every linux system, and the installation
is easy via CPAN shell. In perl, reading a binary and
dumping it into a C or text file are just a few lines
of code, if you have the right library. And those are
just a few commands away, thanks to CPAN.


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

Either dump to terminal:

`bin2hex.pl filename.bmp test`

Or dump into C file:

`bin2hex.pl filename.bmp test > test.c`

Will read in the binary file test.bmp and create a C file test.c
which will contain a C array named test_Table with a hexdump of the contents
of test.bmp and a C structure named test with a reference to the 
array and the number of (relevant) bytes of the array.

Afterwards, simply copy the C file to the img folder within you
project (e.g. bilder dir within ub_lib).

You can pass bin2hex.pl any binary file you like, it is not especially
designed for bmp files.

By default, the resulting C file uses a generic layout. By uncommenting
the include and the struct type, you can use it directly with ub_lib
for graphic LCDs 

(see stm32_ub_graphic by admin_ub (http://mikrocontroller.bplaced.net/wordpress/?page_id=744)

If you require a different layout for your C file, you can easily adapt the 
here documents in the perl script or the resulting C file.

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


THANKS AND CREDITS TO
=====================

admin_ub from http://mikrocontroller.bplaced.net/wordpress/?page_id=744 for his 
excellent STM32F4 libraries and infos.

Elia from http://eliaselectronics.com/stm32f4-tutorials/ for the - IMO - best working and easiest
to use tutorial on setting up a gcc-based toolchain for STM32 under linux - WITHOUT
having to use Eclipse for something as simple as coding C for a microcontroller.

Uri Guttman for File::Slurp (http://search.cpan.org/~uri/File-Slurp-9999.19/lib/File/Slurp.pm)

David Cantrell for Data::Hexdumper (http://search.cpan.org/~dcantrell/Data-Hexdumper-3.0001/lib/Data/Hexdumper.pm)

David Ljung Madison for Image::BMP (http://search.cpan.org/~daveola/Image-BMP-1.17/lib/Image/BMP.pm)




