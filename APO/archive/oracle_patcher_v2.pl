#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

#Directory Variables
our $ORACLE_HOME='';
our $APO="/oracle/APO";
our $shutdown_log="$ORACLE_HOME/shutdown.log";


#=======================================
#Take parameter input                  #
###=====================================

GetOptions("home=s" => \$ORACLE_HOME);

#Unix Commands

our $cmd_startup = "$APO/startup.sh";
our $cmd_shutdown =  "$APO/shutdown.sh";
our $cmd_apply_patch = "$ORACLE_HOME/OPatch/opatch apply -silent -ocmrf $ORACLE_HOME/OPatch/apo.rsp";
our $cmdpatch = "$ORACLE_HOME/OPatch/datapatch -verbose";




#======================================
#Shutdown all database and listener   #
#======================================
print "Shutting down the listener and all corresponding databases....\r\n";
print "Logging to: $ORACLE_HOME/shutdown.log \r\n ";
system ($cmd_shutdown);


#========================================
#Apply patch                            #
#========================================
print "Applying patch......\r\n";
system ($cmd_apply_patch);



#=======================================
#Postpatch                             #
#=======================================

print "Starting up Database\r\n";
system ($cmd_startup);
print "logging in: $ORACLE_HOME/startup.log\r\n";


print "Applying datapatch per database \r\n";
my $filename = 'oratab';
chomp ($filename);


open (FILE, "/etc/$filename") || die "Cannot open your file: $1";

while (my $line = <FILE> ){
        chomp $line;
        my @sid = $line =~  /^(.*?):\//;

        foreach  (@sid)
        {

          my $cmd_setsid = "export ORACLE_SID=$_";
          my $cmdpatch = "$ORACLE_HOME/OPatch/datapatch -verbose";


          print "$cmd_setsid\r\n";
          print "$cmdpatch\r\n";

          $ENV{ORACLE_SID}="$_";
          $ENV{ORACLE_HOME}="$ORACLE_HOME";
	  sleep (30);
          system($cmdpatch);
        }

}
close (FILE);
print "Patching Complete";

