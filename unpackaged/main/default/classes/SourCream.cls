public class SourCream extends Ingredient {
    
    Item item;
    
    public SourCream(Item item){
        this.item = item;
    }
    
    public override string getDescription(){
        return item.getDescription()+',  Sour Cream';
    }
    
    public override decimal cost(){
        return item.cost()+0.15;
    }

}