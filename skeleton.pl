#!/usr/bin/perl -w
#
# Script description goes here

use strict;
use Getopt::Std;

# Global variables
my $verbose;
my $outfile;

# Debug info display routine
sub debug
{
  my $msg = $_[0];
  if (defined $.) {
    print STDERR "$.: $msg\n" if $verbose;
  } else {
    print STDERR "$msg\n" if $verbose;
  }
}


# Help display routine
sub usage
{
  print <<EOT;
Usage: blabla
EOT
  exit(1);
}


# Process options
my %options = ();
getopts("hvo:", \%options);
$outfile = defined($options{'o'}) ? $options{'o'} : "-";
$verbose = defined($options{'v'}) ? 1 : 0;
if (defined($options{'h'})) { usage; }


# Main code here
