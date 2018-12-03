#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

our $email_conf = "/oracle/scripts/asbo/check_databases_email.sh";

#Detect environment and invoke the relevant string substitution
our $current_env= "$ENV{'HOST_NAME'}";
chomp ($current_env);


print "current environenment is: \n";
print "$current_env \n";

if ($current_env eq "edu-dev-db20.decc.local") 
{
	print "Setting up Development Environment... \n";
	my $cmd_change_string_0 = "perl -pi.back -e 's{Databases Alerts}{Dev Databases}g;' $email_conf";
	my $cmd_change_string_1 = "perl -pi.back -e 's{\Q+\Ealerts_my_databases}{\Q+\Edev_databases}g;' $email_conf";
	my $cmd_change_string_2 = "perl -pi.back -e 's{mydomain.co.uk}{fivium.co.uk}g;' $email_conf";	
	my $cmd_change_string_3 = "perl -pi.back -e 's{email_to}{tech}g;' $email_conf";
	my $cmd_change_string_4 = "perl -pi.back -e 's{email_cc1}{tom.dale}g;' $email_conf";
	my $cmd_change_string_5 = "perl -pi.back -e 's{email_cc2}{mark.eva}g;' $email_conf";
	my $cmd_change_string_6 = "perl -pi.back -e 's{email_cc3}{kwok\Q-\Eyao.chim}g;' $email_conf";
	
	`$cmd_change_string_0`;
	`$cmd_change_string_1`;
	`$cmd_change_string_2`;
	`$cmd_change_string_3`;
	`$cmd_change_string_4`;
	`$cmd_change_string_5`;
	`$cmd_change_string_6`;	
	
}
elsif ($current_env eq "fiviuaa23.miniserver.com")
{
	print "Setting up Memset Environment... \n";
        
	my $cmd_change_string_0 = "perl -pi.back -e 's{Databases Alerts}{eCase Memset Databases}g;' $email_conf";
        my $cmd_change_string_1 = "perl -pi.back -e 's{\Q+\Ealerts_my_databases}{\Q+\EeCase_Memset_databases}g;' $email_conf";
        my $cmd_change_string_2 = "perl -pi.back -e 's{mydomain.co.uk}{fivium.co.uk}g;' $email_conf";
        my $cmd_change_string_3 = "perl -pi.back -e 's{email_to}{tech}g;' $email_conf";
        my $cmd_change_string_4 = "perl -pi.back -e 's{email_cc1}{tom.dale}g;' $email_conf";
        my $cmd_change_string_5 = "perl -pi.back -e 's{email_cc2}{mark.eva}g;' $email_conf";
        my $cmd_change_string_6 = "perl -pi.back -e 's{email_cc3}{kwok\Q-\Eyao.chim}g;' $email_conf";

        `$cmd_change_string_0`;
        `$cmd_change_string_1`;
        `$cmd_change_string_2`;
        `$cmd_change_string_3`;
        `$cmd_change_string_4`;
        `$cmd_change_string_5`;
        `$cmd_change_string_6`;



}

elsif ($current_env eq "lemms.bastionvdc.local")
{
	print "Setting up UKCLOUD environment... \n";

	my $cmd_change_string_0 = "perl -pi.back -e 's{Databases Alerts}{Spire and eCase Prime Live Databases}g;' $email_conf";
        my $cmd_change_string_1 = "perl -pi.back -e 's{\Q+\Ealerts_my_databases}{\Q+\Espire-ecase-ukcloud-live}g;' $email_conf";
        my $cmd_change_string_2 = "perl -pi.back -e 's{mydomain.co.uk}{fivium.co.uk}g;' $email_conf";
        my $cmd_change_string_3 = "perl -pi.back -e 's{email_to}{tech}g;' $email_conf";
        my $cmd_change_string_4 = "perl -pi.back -e 's{email_cc1}{tom.dale}g;' $email_conf";
        my $cmd_change_string_5 = "perl -pi.back -e 's{email_cc2}{mark.eva}g;' $email_conf";
        my $cmd_change_string_6 = "perl -pi.back -e 's{email_cc3}{kwok\Q-\Eyao.chim}g;' $email_conf";

        `$cmd_change_string_0`;
        `$cmd_change_string_1`;
        `$cmd_change_string_2`;
        `$cmd_change_string_3`;
        `$cmd_change_string_4`;
        `$cmd_change_string_5`;
        `$cmd_change_string_6`;



}
else 
{
	print "Could not find any match. Exiting... \n";

}
