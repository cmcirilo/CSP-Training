public class EstudosSOQL {

    public static List<Contact> getAllContacts(){
        return [SELECT Name FROM Contact];
    }
    
    
    public static List<Contact> buscarTodasAsCriancas(){
        return [SELECT Name 
                FROM Contact 
                WHERE RecordType.DeveloperName = 'Crianca'];
    }
    
    public static List<Contact> retornaContatosPorTipo(String tipo){
        return [SELECT Name , RecordType.Name
                FROM Contact 
                WHERE RecordType.DeveloperName = :tipo];
    }
    
    public static Map<String, Decimal> retornaMapaCriancasPresente(){
        List<AggregateResult> results = [SELECT Crianca__r.Name nome, SUM(Produto__r.Valor__c) somaValor
                                    FROM Presente__c
                                    GROUP BY Crianca__r.Name];
        
        Map<String, Decimal> mapaSomatoriaValorPorCrianca = new Map<String, Decimal>();
        
        for (AggregateResult agregacao : results) {
            String nomeCrianca = (String) agregacao.get('nome');
            Decimal somaValor = (Decimal) agregacao.get('somaValor') ;
                
            mapaSomatoriaValorPorCrianca.put(nomeCrianca,somaValor);
        }
        
        return mapaSomatoriaValorPorCrianca;
    }
    
    public static void updateMailContacts(Integer limitSize){
        
        List<Contact> criancas = [SELECT FirstName FROM Contact WHERE RecordType.DeveloperName= 'Crianca' and Id = '0035f0000095eVqAAI' LIMIT :limitSize];
        
        for(Contact contato: criancas){
            contato.Email = contato.FirstName.toLowerCase() + '@gmail.com';
        }
        
        update criancas;
    }
    
}