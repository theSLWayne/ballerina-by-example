import ballerina/io;

public function main() {
    // Creating a json variable.
	json jsn = {
        "Name": "Hiran Hasanka",
        "Age": 23,
        "Birthday": "31st October"
    };
    // This should output map<json>
    io:println(typeof jsn);
}