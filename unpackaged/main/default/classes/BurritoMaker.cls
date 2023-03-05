@RestResource(urlMapping='/BurritoBuilder/*')
global with sharing class BurritoMaker {

    @HttpGet
    global static Decimal doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String ingredients = RestContext.request.params.get('ingredients');
        Item burrito = BurritoBuilder.addIngredients(ingredients);
        return burrito.cost;
    }
  
}