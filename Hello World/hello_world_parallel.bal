// This uses 'workers' to print "Hello, World!" in parallel using Ballerina.
// A worker is a sequence of statements that is concurrently with other workers in the functions.

import ballerina/io;
public function main() {

    @strand {thread: "any"}
    worker w1 {
        io:println("Hello, World! #1");
    }    
		
		@strand {thread: "any"}
    worker w2 {
        io:println("Hello, World! #2");
    }    
		
		@strand {thread: "any"}
    worker w3 {
        io:println("Hello, World! #3");
    }
}
