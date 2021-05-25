@istest
public class GoogleMapMultipleObjectTest {
    @AuraEnabled
     public static testMethod void test() 
    {
        Project__c pro            = new Project__c();
        pro.Name				  = 'Test Project';
        pro.Country__c			  = 'USA';
        pro.City__c				  = 'Fountain Valley';
        pro.Zip_Postal_Code__c    = '92708';
        pro.Street__c			  ='9827 Franklin Road';
        pro.State_Province__c     = 'California';
        
        insert pro;
        
        
        GoogleMapMultipleObject.getRecord(pro.Id);
    }

}