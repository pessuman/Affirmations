public class AdinkraRequest {
    public static void getAllAdinkra(){
        // We instantiate a new Http object and a new HttpRequestObject
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // We define where we are sending it. Note that we must first white list any url we wish to make a callout to by adding it in
        // our Remote Site Settings
        request.setEndpoint('https://adinkra.herokuapp.com/symbols');
        
        request.setMethod('GET');
        
        // Now we send the request
        HttpResponse response = http.send(request);
        
        // Once we get our response, we can perform an action.
        
        if(response.getStatusCode() == 200){
            
            List<Object> AdinList = (List<Object>) JSON.deserializeUntyped(response.getBody());
            
            // only the first index of the list is populated, so we'll type cast the first index of the list to a map of strings to
            // objects, so these will map the keys in the JSON to their values
            Map<String,Object> AdinMap = (Map<String,Object>) AdinList[0];
            
            // we'll take the response and insert a new elephant record with its details
            Artifact__c oneAdin = new Artifact__c();
            
            // the keys in the response for the name, sex, species, and description are name, sex, species, and description, 
            // respectively
            // since the values of those keys are stored as objects in our map, we'll have to type cast them to the appropriate data
            // type for our fields (strings in this case)
            oneAdin.Name = (String) AdinMap.get('name');
            oneAdin.Image__c = (String) AdinMap.get('image');
            oneAdin.Meaning__c = (String) AdinMap.get('meaning');
            oneAdin.Synopsis__c = (String) AdinMap.get('synopsis');
            
            // insert the elephant
            insert oneAdin;
        }
    }
    
}