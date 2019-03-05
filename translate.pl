#!/usr/bin/env perl

use strict;
use warnings;

sub do_until_complete {
	my $func = $_[0];
	my $arg = $_[1];
	my $prevarg;
	do {
		$prevarg = $arg;
		$arg = &$func($arg);
	} while ($arg ne $prevarg);
	$_ = $arg;
}

sub s_expr_not {
	s/([a-z])'/\(¬ $1\)/;
	return $_;
}

sub mul_expand {
	s/([a-z]'?)([a-z]'?)/$1 * $2/;
	return $_;
}

sub s_expr_and {
	s/(\((?:[^()]++|(?1))*\)|[a-z])\s+\*\s+(\((?:[^()]++|(?1))*\)|[a-z])/(∧ $1 $2)/;
	return $_;
}

sub s_expr_or {
	s/(\((?:[^()]++|(?1))*\)|[a-z])\s+\+\s+(\((?:[^()]++|(?1))*\)|[a-z])/(∨ $1 $2)/;
	return $_;
}

sub clean {
	s/ +/ /g;
	s/ +\)/)/g;
	return;
}

while (<>) {
	do_until_complete(\&mul_expand, $_);
	do_until_complete(\&s_expr_not, $_);
	do_until_complete(\&s_expr_and, $_);
	do_until_complete(\&s_expr_or, $_);
	clean;
	print;
}
