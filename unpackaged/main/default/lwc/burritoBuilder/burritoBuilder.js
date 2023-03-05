import { LightningElement,wire,track} from 'lwc';
import BURRITO_PIC from '@salesforce/resourceUrl/burritoPic';
import makeBurrito from '@salesforce/apex/BurritoBuilder.createBurrito';
import add_ingredients from '@salesforce/apex/BurritoBuilder.addIngredients';
export default class Cards extends LightningElement {

    @track ingredients = [];
    cost = 0;
    error;
    burritoPicture = BURRITO_PIC;
    protein = 0;
    protein_label;
    rice = 0;
    rice_label;
    guac = 0;
    guac_label;
    cheese = 0;
    cheese_label;
    veggies = 0;
    veggies_label;
    sourCream = 0;
    sourCream_label;

    @wire(makeBurrito) burrito;
    
    addCondiment(event){
        if(event.altKey){ this.rmvCondiment(event); return; }
        let ingridient = event.currentTarget.getAttribute("data-item");
        switch (ingridient) {
            case 'protein' :
                this.protein++;
                this.protein_label = this.protein+'x';
                break;
            case 'rice' :
                this.rice++;
                this.rice_label = this.rice+'x';
                break;
            case 'guacamole' :
                this.guac++;
                this.guac_label= this.guac+'x';
                break;
            case 'cheese' :
                this.cheese++;
                this.cheese_label= this.cheese+'x';
                break;
            case 'veggies' :
                this.veggies++;
                this.veggies_label= this.veggies+'x';
                break;
            case 'sourcream' :
                this.sourCream++;
                this.sourCream_label= this.sourCream+'x';
                break;
        }
        this.calculateCost();
    }

    rmvCondiment(event){
        let ingridient = event.currentTarget.getAttribute("data-item");
        switch (ingridient) {
            case 'protein' :
                if(this.protein == 0) break;
                this.protein--;
                this.protein_label = this.protein+'x';
                break;
            case 'rice' :
                if(this.rice == 0) break;
                this.rice--;
                this.rice_label = this.rice+'x';
                break;
            case 'guacamole' :
                if(this.guac == 0) break;
                this.guac--;
                this.guac_label= this.guac+'x';
                break;
            case 'cheese' :
                if(this.cheese == 0) break;
                this.cheese--;
                this.cheese_label= this.cheese+'x';
                break;
            case 'veggies' :
                if(this.veggies == 0) break;
                this.veggies--;
                this.veggies_label= this.veggies+'x';
                break;
            case 'sourcream' :
                if(this.sourCream == 0) break;
                this.sourCream--;
                this.sourCream_label= this.sourCream+'x';
                break;
        }
        this.calculateCost();
    }

    calculateCost(){
        this.ingredients = [];
        this.ingredients.push(
            {'protein':this.protein},{'rice':this.rice},
            {'guacamole':this.guac},{'cheese':this.cheese},
            {'veggies':this.veggies},{'sourcream':this.sourCream}
        )

       add_ingredients({ingredients:JSON.stringify(this.ingredients)}).then(result => {
            this.burrito = result;
        })
        .catch(error => {
            this.error = 'cannot add ingredients';
            console.log('>>> '+error);
            console.log('>>> '+JSON.stringify(error));
        })
          
    }

   
}