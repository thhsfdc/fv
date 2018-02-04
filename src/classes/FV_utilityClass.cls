public class FV_utilityClass {
    
    public void FVutilityClass()
    {
        // constructor
        system.debug('FV utilityclass');
    }
    
    public static String getRecordTypeId(String objectName, String recordtypeDevName) {
        system.debug('## GetRecordTypeId: objectName='+objectName + '\nrecordtypeDevName='+recordtypeDevName);
        RecordType rt;
        try {
            rt = [Select r.Id, r.Name, r.SobjectType 
                  From RecordType r 
                  Where SobjectType= :objectName
                  and DeveloperName =: recordtypeDevName 
                  and IsActive = true limit 1];
        } catch (Exception e) {
            system.debug('## GetRecordTypeId Exception: '+ e );
        }
        if (rt != null) 
        {
            system.debug('## GetRecordTypeId rt: '+ rt );
            return rt.Id;
        }
        else 
        {
            system.debug('## no Recorytype found ');
            return null;
        }            
    }
    
}