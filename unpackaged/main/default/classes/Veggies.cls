public class Veggies extends Ingredient {
    
    Item item;
    
    public Veggies(Item item){
        this.item = item;
    }
    
    public override string getDescription(){
        return item.getDescription()+', Veggies';
    }
    
    public override decimal cost(){
        return item.cost()+0.50;
    }

}