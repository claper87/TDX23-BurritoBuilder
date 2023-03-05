public class BurritoBuilder {

    @AuraEnabled(cacheable=true)
    public static Item createBurrito() {
        return new burrito();
    }
    
    
    @AuraEnabled
    public static Item addIngredients(string ingredients) {
        Item burrito = new Burrito();
        List<Map<String, Integer>> ingrs = (List<Map<String,Integer>>) json.deserialize(ingredients,List< Map<String,Integer>>.class);
        for(Map<String,Integer> thisIngredient : ingrs){
            String thisKey = new List<String>(thisIngredient.keySet())[0];
            Integer quantity = thisIngredient.get(thisKey);
            switch on thisKey {
                when 'protein' {
                    burrito = addProtein(burrito,quantity);
                }
                when 'rice'{
                    burrito = addRice(burrito,quantity);
                }
                when 'guacamole' {
                    burrito = addGuac(burrito,quantity);
                }
                when 'cheese'{
                    burrito = addCheese(burrito,quantity);
                }
                when 'veggies' {
                    burrito = addVeggies(burrito,quantity);
                }
                when 'sourcream'{
                    burrito = addSourCream(burrito,quantity);
                }
                when else {
                    
                }
            }
        }
        
        return burrito; 
        
    }
    
    public static Item addProtein(Item burrito, Integer quantity) {
        for(Integer i =0; i<quantity; i++){
            burrito = new Protein(burrito);
        }
        return burrito;
        
    }
    
    public static Item addRice(Item burrito, Integer quantity) {
        for(Integer i =0; i<quantity; i++){
            burrito = new Rice(burrito);
        }
        return burrito;  
        
    }

    public static Item addGuac(Item burrito, Integer quantity) {
        for(Integer i =0; i<quantity; i++){
            burrito = new Guacamole(burrito);
        }
        return burrito;
        
    }
    
    public static Item addCheese(Item burrito, Integer quantity) {
        for(Integer i =0; i<quantity; i++){
            burrito = new Cheese(burrito);
        }
        return burrito;  
        
    }

    public static Item addVeggies(Item burrito, Integer quantity) {
        for(Integer i =0; i<quantity; i++){
            burrito = new Veggies(burrito);
        }
        return burrito;
        
    }
    
    public static Item addSourCream(Item burrito, Integer quantity) {
        for(Integer i =0; i<quantity; i++){
            burrito = new SourCream(burrito);
        }
        return burrito;  
        
    }

}