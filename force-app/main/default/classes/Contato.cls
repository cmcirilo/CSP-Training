public virtual class Contato {

    private String nome;
    private String email;
    private Integer idade;  
    
    public String getNome(){
        return nome;
    }
    
    public Contato(){
    }
    
    public Contato(String nome, String email, Integer idade){
        this.nome = nome;
        this.email = email;
        this.idade = idade;
    }
        
    public String vaiGanharPresente(){
        if (this.idade < 18){
            return 'Sim, aproveita';
        }
        return 'Não, já passou seu tempo';
    }
    
    public String retornarNomeMinusculo(){
        return this.nome.toLowerCase();
    }
    
}