public class Crianca extends Contato {

	public static final String TIPO = 'Criança';
    
    private Boolean isAprovado; 
    
    private Integer numPresentes;
    
    //private List<String> presentes;
    
    public Crianca(){
        
    }
    
    public Crianca(String nome, String email, Integer idade, Boolean isAprovado, Integer numPresentes){
        super(nome, email, idade);
        this.isAprovado = isAprovado;
        this.numPresentes = numPresentes;
    }
    
}