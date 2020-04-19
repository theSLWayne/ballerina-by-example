import ballerina/http;
import ballerina/io;

#bound to port 9090

service hello on new http:Listener(9090) {
		# Caller - cleint invoking the resource
		# Request - inbound request
		resource function sayHello(http:Caller caller, http:Request request) {
				//Sending a response back to the caller.
				error? result = caller -> respond("Hello Ballerina!");
				if (result is error) {
						io:println("Error in responding: ", result);
					}
			}
	}
