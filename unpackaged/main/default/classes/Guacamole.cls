public class Guacamole extends Ingredient {
    
    Item item;
    
    public Guacamole(Item item){
        this.item = item;
    }
    
    public override string getDescription(){
        return item.getDescription()+',  **Guacamole**';
    }
    
    public override decimal cost(){
        return item.cost()+0.75;
    }

}