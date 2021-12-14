trigger ContactTrigger on Contact (before insert, after insert) {
    
    //System.debug('------------ EXECUTOU ANTES DO INSERT');
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            
            for(Contact contato : Trigger.New){
                //System.debug('--------DENTRO DO FOR');
                
                if (String.isEmpty(contato.Email)){
                    contato.Email.addError('Deu erro no email');
                }
                
                contato.ExternalId__c = contato.Email;
                
                if(contato.StatusAprovacao__c == 'Aprovado'){
                    
                    contato.DataHoraAprovacao__c = System.now();
                }
            }
            
        }
    }else if(Trigger.isAfter) {
        
        System.debug('passou 1');
        if (Trigger.isInsert){
             System.debug('passou 2');
            Id recordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName()
                .get('Crianca').getRecordTypeId();
            
            List<Task> tarefas = new List<Task>();
            
            for(Contact contato : Trigger.New){
                 System.debug('passou 3');
                if(contato.RecordTypeId == recordTypeId){
                     System.debug('passou 4');
                    Task t = new Task();
                    t.OwnerId = UserInfo.getUserId();
                    t.Subject = 'Analisar dados da Criança';
                    t.Status = 'Open';
                    t.Priority = 'Normal';
                    t.WhoId = contato.Id;
                    t.ActivityDate = System.today().addDays(2);
                    tarefas.add(t);
                }
                
            }
             System.debug('passou 5');
            insert tarefas;
        }
    }
    
    
    
}