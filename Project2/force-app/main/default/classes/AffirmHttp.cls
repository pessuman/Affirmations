public class AffirmHttp {
    public static string getAffirmation() {
        
        String affirmss;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.affirmations.dev');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
          map<String, object> results = (map<String, object>) JSON.deserializeUntyped(response.getBody());
            
            // Cast the values in the 'affirmation' key as a list
    			map<String, object> thisAffirm =  (map<String, object>) results.get('affirmation');
            
            affirmss = string.valueOf(thisAffirm.get('affirmation'));
                     system.debug(affirmss);
        }
        return affirmss;
        
	}
    
}