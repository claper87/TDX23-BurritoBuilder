public class Rice extends Ingredient {
    
    Item item;
    
    public Rice(Item item){
        this.item = item;
    }
    
    public override string getDescription(){
        return item.getDescription()+', rice';
    }
    
    public override decimal cost(){
        return item.cost()+1.00;
    }

}