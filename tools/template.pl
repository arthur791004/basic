#!/usr/bin/perl

########################################
# <description>
########################################

########################################
# import
########################################
use File::Basename;
use Cwd;
use Getopt::Std;
use strict;

########################################
# global constants (path, cmd, 
########################################
$LOG_FILE = "<tool name>.log"

########################################
# global variables
########################################
my %g_Opt;

########################################
# exec cmd
########################################
sub ExecCmd {
	my ($szCmd, $bIgnoreErr) = @_;
	my $nRet;

	if(($nRet = system($szCmd)) != 0) {
		ErrInfo("[ERR] $szCmd (rc=$nRet)");
		Logger($CMD_LOG_FILE, "[ERR] $szCmd (rc=$nRet)");

		exit if(!$bIgnoreErr);
	}
	return $nRet;
}

########################################
# show color text
########################################
sub ShowText {
	my ($nCol, $szText) = @_;

	print "\x1B[1;".$nCol."m".$szText."\x1B[0m\n";
	Logger($PKG_LOG_FILE, $szText);
}

########################################
# show info
########################################
sub MsgInfo {
	ShowText(33, "[INFO]: ". (shift));
}

########################################
# show error
########################################
sub ErrInfo {
	ShowText(31, "[ERROR]: ". (shift));
}

########################################
# logger
########################################
sub Logger {
	my ($LogFile, $Msg) = @_;
	my $szTimeStamp;

	$szTimeStamp = `$UTIL_DATE "+[%y/%m/%d %H:%M:%S]"`;
	chomp $szTimeStamp;

	open(LOUT, ">>$LogFile") || print STDERR "[WARNING]Can't
write log data.\n";
	print LOUT "$szTimeStamp $Msg \n";
	close(LOUT);
}

########################################
# print usage
########################################
sub usage {
	print(<<EOF
Usage: $0 <options>
    command:
        ...
    help:
        -h: show usage
EOF
);
	exit;
}

########################################
# main
########################################
sub main {
	getopts('<options>', \%g_Opt);

	usage() if(defined($g_Opt{'h'}));
}

&main();
