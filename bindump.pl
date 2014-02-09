#!/usr/bin/perl -w
use strict;
use File::Slurp;
use Data::Hexdumper qw(hexdump);

# https://github.com/Stemer114/GLCDFileTools

#--------------------------------------------------------------
my $usage = qq!
Usage: ./bindump "name of input file"
!;
#--------------------------------------------------------------

# read and check params
my ($in) = @ARGV;
die "Error: Missing input file name.\n$usage" unless $in;

# read binary file and get length in bytes
my $bin_data = read_file( $in, { binmode => ':raw'} ) ;
my $bin_length = length($bin_data);

print hexdump(
    data => $bin_data,
    suppress_warnings => 1,
);


