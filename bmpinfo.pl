#!/usr/bin/perl -w
use strict;
use Image::BMP;

# https://github.com/Stemer114/GLCDFileTools

#--------------------------------------------------------------
my $usage = qq!
Usage: ./bmpinfo.pl "name of bmp file"
!;
#--------------------------------------------------------------

# read and check params
my ($in) = @ARGV;
die "Error: Missing input file name.\n$usage" unless $in;


# Example one:
my $img = new Image::BMP(
    file            => $in,
    debug           => 1,
);
$img->view_ascii;

print "\n";
print "FileSize: $img->{FileSize} \n";
print "DataOffset: $img->{DataOffset} \n";
print "HeaderSize: $img->{HeaderSize} \n";
print "Resolution: $img->{Width} x $img->{Height} (W x H)\n";
print "Planes: $img->{Planes} \n";
print "BitCount: $img->{BitCount} \n";
print "ColorBytes: $img->{ColorBytes} \n";
print "Compression: $img->{Compression} \n";
print "ImageSize: $img->{ImageSize} \n";
print "XpixelsPerM: $img->{XpixelsPerM} \n";
print "YpixelsPerM: $img->{YpixelsPerM} \n";
print "ColorsUsed: $img->{ColorsUsed} \n";
print "ColorsImportant: $img->{ColorsImportant} \n";


