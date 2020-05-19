// This uses 'workers' to print "Hello, World!" in parallel using Ballerina.
// A worker is a sequence of statements that is concurrently with other workers in the functions.

import ballerina/io;

public function main()
{
	// Creating a worker
	worker w1
	{
		io:println("Hello World! #m"); 
	}

	worker w2
	{
		io:println("Hello World! #n"); 
	}

	worker w3
	{
		io:println("Hello World! #k"); 
	}
}