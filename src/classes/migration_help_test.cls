@isTest
public class migration_help_test {

    public static testMethod void doIttest()
    {
        Contact con = new Contact();
        con.lastname = 'last';
        con.firstname = 'first';
        con.email = 'lf@dummy.org';
        con.MigrationID__c = 'MigIdStr';
        Test.startTest();           
        insert con;
        migration_help.mighelp();
        migration_help.doIt();
        Test.stopTest(); 
    }


}