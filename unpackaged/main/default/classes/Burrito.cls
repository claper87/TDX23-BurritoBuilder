public class Burrito extends Item{
    
    public Burrito(){
        description = 'Base Burrito';
    }
    
    
    public override string getDescription(){
        return description;
    }
    
    public override decimal cost(){
        return 6.00  ;
    }
    

}