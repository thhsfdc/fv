@isTest
// see https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_controller_error_handling.htm
public class FV_CreateUserFromContact_test {
    
    public static testMethod void testUserCreation() {
        
        List<Account> vorstandAcctLst = FV_TestDataFactory.createVorstand();
        List<Account> mitgliedAcctLst =  FV_TestDataFactory.createMitglied();

        Account vorstandAcct = new Account();
        Account mitgliedAcct = new Account();

        if (null != vorstandAcctLst.size()) {
            vorstandAcct = vorstandAcctLst[0];
            system.debug(' Vorstandacct='+vorstandAcct);
        }
        if (null != mitgliedAcctLst.size()) {
            mitgliedAcct = mitgliedAcctLst[0];
            system.debug(' Vorstandacct='+mitgliedAcct);
        }

        List<Contact> mitgliederContactLst = FV_TestDataFactory.createContacts(2, 'Vorstand', vorstandAcct.Id);
        
        FV_CreateUserFromContact f = new FV_CreateUserFromContact();
        f.sourceContactId = mitgliederContactLst[0].Id;
        system.debug(' test f ='+f);
        


    }

}