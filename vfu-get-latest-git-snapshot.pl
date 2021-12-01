#!/usr/bin/perl
##############################################################################
#
# Copyright (c) 1996-2021 Vladi Belperchinov-Shabanski "Cade" 
#
##############################################################################
use strict;

my $dest = shift;

die "need accessible target directory as 1st arg\n" unless $dest and chdir( $dest );

clone_or_update( "https://github.com/cade-vs/vfu-dist.git" );
chdir( 'vfu-dist' );
clone_or_update( "https://github.com/cade-vs/vfu.git" );
clone_or_update( "https://github.com/cade-vs/vslib.git" );
clone_or_update( "https://github.com/cade-vs/vstring.git" );
clone_or_update( "https://github.com/cade-vs/yascreen.git" );
status( "done." );

sub clone_or_update
{
  my $repo = shift;
  
  my $dir  = $1 if $repo =~ /([^\/]+)\.git$/;
  
  die "cannot figure dir name from repo [$repo]" unless $dir;

  if( -e $dir )
    {
    status( "updating $repo" );
    chdir( $dir );
    system qq[ git pull origin master ];
    chdir( '..' );
    }
  else
    {
    status( "cloning $repo" );
    system qq[ git clone $repo ];
    }  
  
  return 1;
}

sub status
{
  my $s = shift;
  print( "\n" . ('-' x 16) . ' ' . $s . "\n" );
}

###EOF########################################################################
