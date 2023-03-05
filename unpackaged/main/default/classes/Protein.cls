public class Protein extends Ingredient {
    
    Item item;
    
    public Protein(Item item){
        this.item = item;
    }
    
    public override string getDescription(){
        return item.getDescription()+', protein';
    }
    
    public override decimal cost(){
        return item.cost()+0.75;
    }

}