public class ContactTriggerHandler extends TriggerHandler{
    
    private List<Contact> newList;
    public ContactTriggerHandler(){
        
    }
    
    protected override void beforeInsert(){
        for(Contact contato : newList){
            if (String.isEmpty(contato.Email)){
                contato.Email.addError('Deu erro no email');
            }
        }
    }
    
}