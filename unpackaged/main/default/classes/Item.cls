public abstract class Item {
    
    @AuraEnabled
    public decimal cost { get{return cost();} set; }
    
    protected string description = 'unknown item';
    
    
    public abstract string getDescription();
    
   
    public abstract decimal cost();

}