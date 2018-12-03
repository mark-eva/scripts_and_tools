#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

our $email_conf = "/app/alerts/check_databases_email.sh";
our $top_sql_report = "/app/alerts/send_sql_reports.pl";

#Detect environment and invoke the relevant string substitution
our $current_env= "$ENV{'HOST_NAME'}";
chomp ($current_env);


print "current environenment is: \n";
print "$current_env \n";

if ($current_env eq "fiv-dev-docker1")
{
        print "Setting up Development Environment... \n";
		
		 print "Setting up Development Environment... \n";
		 my $cmd_change_string_0 = "perl -pi.back -e 's{Databases Alerts}{Dev Databases}g;' $email_conf";
		 my $cmd_change_string_1 = "perl -pi.back -e 's{\Q+\Ealerts_my_databases}{\Q+\Edev_databases}g;' $email_conf";
		 my $cmd_change_string_2 = "perl -pi.back -e 's{mydomain.co.uk}{fivium.co.uk}g;' $email_conf";
		 my $cmd_change_string_3 = "perl -pi.back -e 's{email_to}{tech}g;' $email_conf";
		 my $cmd_change_string_4 = "perl -pi.back -e 's{email_cc1}{tom.dale}g;' $email_conf";
		 my $cmd_change_string_5 = "perl -pi.back -e 's{email_cc2}{mark.eva}g;' $email_conf";
		 my $cmd_change_string_6 = "perl -pi.back -e 's{email_cc3}{kwok\Q-\Eyao.chim}g;' $email_conf";

		 my $cmd_change_string_7 = "perl -pi.back -e 's{mail_host_server}{fiv-smtp-out.fivium.local}g;' $top_sql_report";
		 my $cmd_change_string_8 = "perl -pi.back -e 's{from_email_address}{fivium-fivium_hosting\Q-\Edevelopment\Q@\Efivium.co.uk}g;' $top_sql_report";
		 my $cmd_change_string_9 = "perl -pi.back -e 's{to_email_address}{tech\Q+\Edev_databases\Q@\Efivium.co.uk}g;' $top_sql_report";
		 my $cmd_change_string_10 = "perl -pi.back -e 's{any_db_from_db_lookup_conf_file}{edust1}g;' $top_sql_report";

		 my $cmd_change_string_11 = "perl -pi.back -e 's{port_number}{25}g;' $email_conf";
		 my $cmd_change_string_12 = "perl -pi.back -e 's{sender}{fivium\Q-\Efivium_hosting\Q-\Edevelopment\Q@\Efivium.co.uk}g;' $email_conf";
		 my $cmd_change_string_13 = "perl -pi.back -e 's{smtp_server}{fiv-smtp-out}g;' $email_conf";


		 `$cmd_change_string_0`;
		 `$cmd_change_string_1`;
		 `$cmd_change_string_2`;
		 `$cmd_change_string_3`;
		 `$cmd_change_string_4`;
		 `$cmd_change_string_5`;
		 `$cmd_change_string_6`;
		 `$cmd_change_string_7`;
		 `$cmd_change_string_8`;
		 `$cmd_change_string_9`;
		 `$cmd_change_string_10`;
		 `$cmd_change_string_11`;
		 `$cmd_change_string_12`;
		 `$cmd_change_string_13`;

		
								
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


        my $cmd_change_string_7 = "perl -pi.back -e 's{mail_host_server}{10.1.57.33}g;' $top_sql_report";
        my $cmd_change_string_8 = "perl -pi.back -e 's{from_email_address}{fivium-fivium_hosting\Q-\EMEMSET_live\Q@\Efivium.co.uk}g;' $top_sql_report";
        my $cmd_change_string_9 = "perl -pi.back -e 's{to_email_address}{tech\Q+\EMEMSET_live\Q@\Efivium.co.uk}g;' $top_sql_report";
        my $cmd_change_string_10 = "perl -pi.back -e 's{any_db_from_db_lookup_conf_file}{ecdcmslv1}g;' $top_sql_report";


        my $cmd_change_string_11 = "perl -pi.back -e 's{port_number}{25}g;' $email_conf";
        my $cmd_change_string_12 = "perl -pi.back -e 's{sender}{fivium\Q-\Efivium_MEMSET_hosting\Q-\Elive\Q@\Efivium.co.uk}g;' $email_conf";
        my $cmd_change_string_13 = "perl -pi.back -e 's{smtp_server}{10.1.57.33}g;' $email_conf";


        `$cmd_change_string_0`;
        `$cmd_change_string_1`;
        `$cmd_change_string_2`;
        `$cmd_change_string_3`;
        `$cmd_change_string_4`;
        `$cmd_change_string_5`;
        `$cmd_change_string_6`;
        `$cmd_change_string_7`;
        `$cmd_change_string_8`;
        `$cmd_change_string_9`;
        `$cmd_change_string_10`;
        `$cmd_change_string_11`;
        `$cmd_change_string_12`;
        `$cmd_change_string_13`;

}
elsif ($current_env eq "lemms.bastionvdc.local")
{
        print "Setting up UKCLOUD environment... \n";

        my $cmd_change_string_0 = "perl -pi.back -e 's{Databases Alerts}{Spire and eCase Prime Live Databases}g;' $email_conf";
        my $cmd_change_string_1 = "perl -pi.back -e 's{\Q+\Ealerts_my_databases}{\Q+\ESpire_Ecase_UKCloud_live}g;' $email_conf";
        my $cmd_change_string_2 = "perl -pi.back -e 's{mydomain.co.uk}{fivium.co.uk}g;' $email_conf";
        my $cmd_change_string_3 = "perl -pi.back -e 's{email_to}{tech}g;' $email_conf";
        my $cmd_change_string_4 = "perl -pi.back -e 's{email_cc1}{tom.dale}g;' $email_conf";
        my $cmd_change_string_5 = "perl -pi.back -e 's{email_cc2}{mark.eva}g;' $email_conf";
        my $cmd_change_string_6 = "perl -pi.back -e 's{email_cc3}{kwok\Q-\Eyao.chim}g;' $email_conf";

        my $cmd_change_string_7 = "perl -pi.back -e 's{mail_host_server}{10.7.20.15}g;' $top_sql_report";
        my $cmd_change_string_8 = "perl -pi.back -e 's{from_email_address}{fivium-fivium_hosting\Q-\EUKCLOUD\Q@\Efivium.co.uk}g;' $top_sql_report";
        my $cmd_change_string_9 = "perl -pi.back -e 's{to_email_address}{tech\Q+\EUKCLOUD_live\Q@\Efivium.co.uk}g;' $top_sql_report";
        my $cmd_change_string_10 = "perl -pi.back -e 's{any_db_from_db_lookup_conf_file}{ecpollv1}g;' $top_sql_report";

        my $cmd_change_string_11 = "perl -pi.back -e 's{port_number}{25}g;' $email_conf";
        my $cmd_change_string_12 = "perl -pi.back -e 's{sender}{fivium\Q-\Efivium_UKCLOUD_hosting\Q-\Elive\Q@\Efivium.co.uk}g;' $email_conf";
        my $cmd_change_string_13 = "perl -pi.back -e 's{smtp_server}{10.7.20.15}g;' $email_conf";

        `$cmd_change_string_0`;
        `$cmd_change_string_1`;
        `$cmd_change_string_2`;
        `$cmd_change_string_3`;
        `$cmd_change_string_4`;
        `$cmd_change_string_5`;
        `$cmd_change_string_6`;
        `$cmd_change_string_7`;
        `$cmd_change_string_8`;
        `$cmd_change_string_9`;
        `$cmd_change_string_10`;
        `$cmd_change_string_11`;
        `$cmd_change_string_12`;
        `$cmd_change_string_13`;


}
elsif ($current_env eq "lemms1.ops.eu-west-2a.fiviumops.aws")
{
        print "Setting up AWS environment... \n";

        my $cmd_change_string_0 = "perl -pi.back -e 's{Databases Alerts}{Ecase on AWS Databases}g;' $email_conf";
        my $cmd_change_string_1 = "perl -pi.back -e 's{\Q+\Ealerts_my_databases}{\Q+\EAWS}g;' $email_conf";
        my $cmd_change_string_2 = "perl -pi.back -e 's{mydomain.co.uk}{fivium.co.uk}g;' $email_conf";
        my $cmd_change_string_3 = "perl -pi.back -e 's{email_to}{tech}g;' $email_conf";
        my $cmd_change_string_4 = "perl -pi.back -e 's{email_cc1}{tom.dale}g;' $email_conf";
        my $cmd_change_string_5 = "perl -pi.back -e 's{email_cc2}{mark.eva}g;' $email_conf";
        my $cmd_change_string_6 = "perl -pi.back -e 's{email_cc3}{kwok\Q-\Eyao.chim}g;' $email_conf";

        my $cmd_change_string_7 = "perl -pi.back -e 's{mail_host_server}{172.21.0.11}g;' $top_sql_report";
        my $cmd_change_string_8 = "perl -pi.back -e 's{from_email_address}{fivium-fivium_hosting\Q-\EAWS_live\Q@\Efivium.co.uk}g;' $top_sql_report";
        my $cmd_change_string_9 = "perl -pi.back -e 's{to_email_address}{tech\Q+\EAWS_live\Q@\Efivium.co.uk}g;' $top_sql_report";
        my $cmd_change_string_10 = "perl -pi.back -e 's{any_db_from_db_lookup_conf_file}{ecdwplv1}g;' $top_sql_report";


        my $cmd_change_string_11 = "perl -pi.back -e 's{port_number}{25}g;' $email_conf";
        my $cmd_change_string_12 = "perl -pi.back -e 's{sender}{fivium\Q-\Efivium_AWS_hosting\Q-\Elive\Q@\Efivium.co.uk}g;' $email_conf";
        my $cmd_change_string_13 = "perl -pi.back -e 's{smtp_server}{172.21.0.11}g;' $email_conf";


        `$cmd_change_string_0`;
        `$cmd_change_string_1`;
        `$cmd_change_string_2`;
        `$cmd_change_string_3`;
        `$cmd_change_string_4`;
        `$cmd_change_string_5`;
        `$cmd_change_string_6`;
        `$cmd_change_string_7`;
        `$cmd_change_string_8`;
        `$cmd_change_string_9`;
        `$cmd_change_string_10`;
        `$cmd_change_string_11`;
        `$cmd_change_string_12`;
        `$cmd_change_string_13`;

}
else
{
        print "Could not find any match. Exiting... \n";

}
