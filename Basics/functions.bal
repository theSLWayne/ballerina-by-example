import ballerina/io;

// This function returns the addition of the two values passed into it.
function addNums(int n1, int n2) returns int {
    return n1 + n2;
}

// This function prints the values passed into it.
function printVal(string value) {
    io:println(value);
}

// This function prints and returns the concatenation of two strings passed into it.
function concatStrs(string value1, string value2) returns string {
    string retVal = value1 + value2;
    io:println(retVal);    
    return retVal;
}

// This is a function which takes three integers a,b & c and returns the vlaues of 1 + 2 * b + 3 * c.
function calculate(int a, int b, int c) returns int {
    return a + 2 * b + 3 * c;
}

// Defaultable parameters 
// These are optional parameters that have a default value. However, all arguments after the first argument should be named arguments.
function generateEbill(int noUnits, int baseAmount = 30, int unitRate = 12) returns int {
    return baseAmount + noUnits * unitRate;
}

// This is a function with a rest parameter. A function can only take one rest parameter. This rest parameter behaves like a list of the declared data type.
// Other parameters should be passed as positional parameters, not named ones.
function printStudentDetails(string name, int age = 18, string... subjects) {
    string details = "Name: " + name + ", Age: " + age.toString();

    // Checking whether any rest parameters are passed
    if (subjects.length() == 0) {
        io:println(details);
        return;
    }

    // Concatenating all the subjects into one string.
    int index = 0;
    string subjectString = "Subject(s): ";
    foreach string subject in subjects {
        if(index == 0){
            subjectString += subject;
        } else {
            subjectString += ", " + subject;
        }
        index += 1;
    }
    io:println(details, ", ", subjectString);

}

// Quoted identifiers can be used to use reserved keywords as identifiers.
// For an example, here I'm using the reserved 'function' keyword as a function name.

function 'function(int a) returns int {
    // There is a integer variable named 'int, also a reserved keyword used as an identifier.
    int 'int = a ^ 2;
    return 'int;
}

// Main function as the entry point.
public function main() {
    // Printing the returned value from calling the function 'addNums' with 5 and 6.
    io:println(addNums(5,6));

    // Parsing string "Hello!" to printVal function.
    printVal("Hello");

    // parsing two strings "Hello" and "Ballerina" to the function concatStrs.
    string concatVal = concatStrs("Hello", "Ballerina");
    io:println("The value returned from concatStrs function: " + concatVal );

    // There are two ways to call the calculate function. First, let's call it by entering vlaues for a,b,c in the order in which the parameters are defined.
    var result1 = calculate(5, 6, 7);

    // Now let's call it by passing values to the function as named arguments. These named arguments are not required to be in the same order in which they are defined.
    var result2 = calculate(5, c = 7, b = 6);

    // Now let's check if both returned values are equal.
    if (result1 == result2) {
        io:println("Same result.");
    }

    // I can call generateEbill function without the values of baseAmount and unitRate. The default values for baseAmount and unitRate are used in calculating eBill.
    var eBill = generateEbill(2);
    io:println("Your bill is: " + eBill.toString());

    // Calling printStudentDetails function with no subjects and no age.
    printStudentDetails("Alice");

    // Calling printStudentDetails function with one subject.
    printStudentDetails("Bob", 20, "Math");

    // Calling printStudentDetails function with two subjects from a list.
    string[] subjectList = ["Math", "Science"];
    printStudentDetails("Saman", 18, ...subjectList);
}
