#!/usr/bin/perl -w
use strict;
use File::Slurp;
use Data::Hexdumper qw(hexdump);

#--------------------------------------------------------------
my $usage = qq!
Usage: ./bin2hex "name of input file" "name of output structure"

Example: ./bin2hex test.bmp Test_Bmp_Table >>test.c

will read in binary file test.bmp and output its content as a c array
into the file test.c
like so:

const uint8_t Test_Bmp_Table[] = {
0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,

!;
#--------------------------------------------------------------

# read and check params
my ($in, $name) = @ARGV;
die "Error: Missing input file name.\n$usage" unless $in;
die "Error: Missing name to use for output structure.\n$usage" unless $name;

# read binary file and get length in bytes
my $bin_data = read_file( $in , binmode => ':raw' ) ;
my $bin_length = length($bin_data);

# print file prefix for c-file
print <<"END";
//--------------------------------------------------------------
// Includes
//--------------------------------------------------------------
// ub graphic LCD library
// see http://mikrocontroller.bplaced.net/wordpress/?page_id=744
#include "../stm32_ub_graphic.h"

//--------------------------------------------------------------
// source file: $in
// size: $bin_length bytes
// hex dump created by bin2hex.pl
// binary data follows
const uint8_t ${name}_Table[] = {
END

# print hexdump as c array
# (each row is printed as 8 hex literals
# caveat: the last row is padded to 8 literals with 0x00 
# if necessary
# make sure that you do not read more than length bytes
# within your application)
print hexdump(
    data => $bin_data,
    suppress_warnings => 1,
    output_format => '0x%C, 0x%C, 0x%C, 0x%C, 0x%C, 0x%C, 0x%C, 0x%C,' 
);
print "};\n";

# print c-structure for array access
print <<END;

UB_Picture ${name} = {
  ${name}_Table,       // binary data
  $bin_length,   // number of payload bytes
};
END



