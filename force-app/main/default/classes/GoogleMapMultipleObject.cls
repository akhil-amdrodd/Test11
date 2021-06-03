public with sharing class GoogleMapMultipleObject {
    public GoogleMapMultipleObject() {

    }
    @AuraEnabled(cacheable=True)
        public static List<Location> getRecord(Id recrId){
            System.debug('recrID'+recrId);
            Id MyId = recrId;
            String sObjName = MyId.getSObjectType().getDescribe().getName();
			system.debug('sObjName ==== >>>'+sObjName);
            sobject acc;
			String query = 'Select Name,Map_Street_Address_1__c,Map_City__c,Map_State__c,Map_Zip_Code__c,Map_Country__c FROM  '+sObjName +' WHERE Id =: MyId';
            system.debug('query ==== >>>>'+query);
            acc = Database.query(query);
		system.debug('acc ==== >>>'+acc);
        system.debug('acc ==== >>>'+acc);
        system.debug('acc ==== >>>'+acc);
        system.debug('acc ==== >>>'+acc);
        List<Location> loc = new List<Location>();
        
        System.debug(acc);
        GeoLocation geoInfo = new GeoLocation();
        geoInfo.Street = String.valueof(acc.get('Street__c'));
        geoInfo.PostalCode = String.valueof(acc.get('Zip_Postal_Code__c'));
        geoInfo.City = String.valueof(acc.get('City__c'));
        geoInfo.State = String.valueof(acc.get('State_Province__c'));
        geoInfo.Country = String.valueof(acc.get('Country__c'));
        Location locDetail = new Location();
        locDetail.icon = 'action:map'; 
        locDetail.title = 'Enquiry Locations';
        locDetail.description = String.valueof(acc.get('Name'));
        locDetail.location = geoInfo;
        
        loc.add(locDetail);
       
        return loc ;  
        }
        public class Location{
        @AuraEnabled 
        public String icon{get;set;} 
        @AuraEnabled 
        public String title{get;set;} 
        @AuraEnabled
        public String description{get;set;} 
        @AuraEnabled 
        public GeoLocation location{get;set;} 
        }
        public class GeoLocation{
        @AuraEnabled 
        public String Street{get;set;}
        @AuraEnabled 
        public String PostalCode{get;set;}
        @AuraEnabled 
        public String City{get;set;}
        @AuraEnabled 
        public String State{get;set;}
        @AuraEnabled 
        public String Country{get;set;}
        }
        

    }