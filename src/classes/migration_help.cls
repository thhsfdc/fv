public class migration_help {
    
    public static void mighelp(ID ContactID)
    {
        system.debug('i am here - mighelp');
    }
       
    public static string StrMigration(String email, String Lastname)
    {
        system.debug('i am here - StrMigration');
        String email_str = (null != email ) ? email :  Lastname+'@'+Lastname +'.dummy';
        string RetString = email_str.toLowerCase() + '|'+ Lastname.toLowerCase();
        return RetString;
    }
    
    public static void doIt()
    {
        system.debug('i am here - doIt');
        List<Contact> ContactList = [select 
                                     id
                                     , email
                                     , lastname
                                     , MigrationID__c
                                    from Contact];
        for (contact c : ContactList)
        {
            c.MigrationID__c = StrMigration(c.Email, c.LastName);
            system.debug('c:'+c.id + ', email:'+c.Email + ', Mig:'+c.MigrationID__c);
        }
        database.update(ContactList);
    }
    
    

}