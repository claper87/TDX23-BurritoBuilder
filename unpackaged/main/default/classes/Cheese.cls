public class Cheese extends Ingredient {
    
    Item item;
    
    public Cheese(Item item){
        this.item = item;
    }
    
    public override string getDescription(){
        return item.getDescription()+', Cheese';
    }
    
    public override decimal cost(){
        return item.cost()+0.25;
    }

}