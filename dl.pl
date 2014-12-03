#!/usr/bin/env perl

use strict;
use warnings;

use Net::GitHub;
use Data::Dumper;

my $github = Net::GitHub->new(login => $ENV{'GITUSERNAME'}, 
			      pass => $ENV{'GITPASSWD'}
    );

my $search = $github->search;
my %data = $search->users({
			   q => 'followers:>100 repos:>100',
			   sort  => 'followers',
			   order => 'desc',
			  });

print Dumper(\$data{'users'});
