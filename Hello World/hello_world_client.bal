import ballerina/http;
import ballerina/io;

public function main()
{
	// Creating an HTTP client to interact with a remote endpoint.
	http:Client clientEP = new ("http://www.mocky.io");
	// Sending a get request to the server.
	var res = clientEP->get("/v2/5ae082123200006b00510c3d/");

	// Retrieve text payload of the response if the request is successful.
	if(res is http:Response){
		var payload = res.getTextPayload();
		if(payload is string) {
			// Printing the recieved payload text
			io:println(payload);
		} else {
			// if an error occured while retrieving the text payload, print the error.
			io:println(<string> payload.detail().message);
		}
	} else {
		// if an error occured when getting the response, print the error.
		io:println(<string> res.detail().message);
	}
}