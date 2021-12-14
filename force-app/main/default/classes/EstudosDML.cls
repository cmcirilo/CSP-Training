public class EstudosDML {

    public static Id criarContato(String primeiroNome, String ultimoNome, String telefone, String celular, String tipo){
        Contact contato = new Contact();
        
        contato.FirstName = primeiroNome;
        contato.LastName = ultimoNome;
        contato.Phone = telefone;
        contato.MobilePhone = celular;
        
        Id recordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get(tipo).getRecordTypeId();
        
        contato.RecordTypeId = recordTypeId;
        
        insert contato;       
        
        return contato.Id;
    }
    
    public static void criarVariosContatos(List<Contact> contatos){
        
        insert contatos;
        
        /*for(Contact contato: contatos){
            insert contato;
        }*/
    }
}