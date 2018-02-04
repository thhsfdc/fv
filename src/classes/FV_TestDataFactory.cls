// https://trailhead.salesforce.com/modules/apex_testing/units/apex_testing_data
@isTest
public class FV_TestDataFactory {
    
    public static List<Contact> createContacts(Integer numContacts
                                                , String MitgliedsType
                                                , String ParentAccountID) 
    {
        List<Contact> contactLst = new List<Contact>();
        for(Integer i=0; i < numContacts; i++) {
            Contact c = new Contact(LastName='TestContact ' + i);
            c.FirstName = 'testFirsName_'+i;
            c.Email= 'testmail@fvnbb.org';
            c.Mitgliedstyp__c= MitgliedsType;
            c.AccountId = ParentAccountID;
            contactLst.add(c);
        }
        insert contactLst;
        return contactLst;
    }
    
    public static List<Account> createVorstand()
    {
        List<Account> accts = new List<Account>();
        Account a = new Account(Name='TestVorstand');
        a.RecordtypeId = FV_utilityClass.getRecordTypeId('Account','Vorstand');
        accts.add(a);
        insert accts;
        system.debug('test - createVorstand:'+accts);
        return accts;
    }

    public static List<Account> createMitglied()
    {
        List<Account> accts = new List<Account>();
        Account a = new Account(Name='TestMitglied');
        a.RecordtypeId = FV_utilityClass.getRecordTypeId('Account','Mitglied');
        
        accts.add(a);
        insert accts;
        system.debug('test - createMitglied:'+accts);
        return accts;
    }
    
    
    public static List<Account> createAccountsWithOpps (Integer numAccts
                                                        , Integer numOppsPerAcct
                                                       ) 
    {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                         StageName='Prospecting',
                                         CloseDate=System.today().addMonths(1),
                                         AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }
}