import ballerina/http;

// HTTP client to call the WSO2 countries API
final http:Client countriesClient = check new ("https://dev-tools.wso2.com");

// HTTP service to expose the countries API
service / on new http:Listener(8080) {
    
    // Resource to get countries data
    resource function get countries() returns json|error {
        // Call the external WSO2 countries endpoint
        json|error response = countriesClient->get(path = "/gs/helpers/v1.0/countries");
        
        if response is error {
            return response;
        }
        
        return response;
    }
}