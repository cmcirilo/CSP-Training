@isTest
public class TestClass {
    
    @testSetup
    public static void setup(){
        
        Id recordTypeIdCrianca = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Crianca').getRecordTypeId();
        
        Id recordTypeIdResponsavel = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Responsavel').getRecordTypeId();
        
        List<Contact> contatos = new List<Contact> {
            new Contact(RecordTypeId=recordTypeIdCrianca, Email = 'crianca11@gmail.com', LastName='Crianca 11', MobilePhone='11994956321', Phone='11994956321'),
                new Contact(RecordTypeId=recordTypeIdResponsavel, Email = 'responsavel11@gmail.com', LastName='Responsavel 11', MobilePhone='11994956321',Phone='11994956321')
        };
        
        insert contatos;
    }
    
    @isTest
    public static void devePreencherExternalId(){
        
        Contact contato = [SELECT ExternalId__c, Email FROM Contact WHERE Email='crianca11@gmail.com'];
        
        System.assert(contato.ExternalId__c == contato.Email);
        System.assertEquals('crianca11@gmail.com', contato.ExternalId__c);
    }
}