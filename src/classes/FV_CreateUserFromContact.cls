// thomas hoeger 24 Nov 2017
// to create users from the "Vorstand Contacts"

public class FV_CreateUserFromContact {
    
    private User templateUsr;
    private List<User> newUserList = new List<User>();
    private Boolean userCreateSuccess = false;
    
    public Id sourceContactId {get; set;}
    
    
    public  FV_CreateUserFromContact(){
        System.debug('constructor for FV_CreateUserFromContact');
        System.debug('constructor sourceContact='+ sourceContactId);
        
        templateUsr = readTemplateUser(System.UserInfo.getUserId());
        System.debug('constructor - Template User is '+templateUsr);
        
        if (null != sourceContactId)
        {
            system.debug('create user call from constructor');
            userCreateSuccess = createUser(sourceContactId);
        }
        
    }
    
    private User readTemplateUser(ID userID){
        templateUsr = [ select id
                       ,ContactId 
                       ,username
                       ,EmailEncodingKey 
                       ,IsExtIndicatorVisible 
                       ,LanguageLocaleKey 
                       ,LocaleSidKey 
                       ,ProfileId 
                       ,ReceivesAdminInfoEmails 
                       ,ReceivesInfoEmails 
                       ,TimeZoneSidKey 
                       ,UserRoleId 
                       ,UserType
                       from User 
                       where Id  =: userID ];
        System.debug('Template User is '+templateUsr);
        return templateUsr;
    } 
    
    
    public Boolean createUser(id contact)
    {
        Boolean successFlg = false;
        system.debug('i am here');
        
        return successFlg;
    }
    
}