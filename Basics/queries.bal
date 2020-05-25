// Query expression consists of four kinds of clauses: "from", "let", "where", "select". First Class should be a "from" and the last should be a "select".
import ballerina/io;

// Creating new records for Students and Reports
type Student record {
  string firstName;
  string lastName;
  int intakeYear;
  float score;
};

type Report record {
  string name;
  string degree;
  int expectedGradYear;
};

type FullName record { 
  string firstName;
  string lastName;
};

// Main function as the entry point
public function main() {
  Student s1 = {firstName: "John", lastName: "Doe", intakeYear: 2019, score: 1.7};
  Student s2 = {firstName: "Saman", lastName: "Kumara", intakeYear: 2020, score: 0.8};
  Student s3 = {firstName: "Shantha", lastName: "Gunaratne", intakeYear: 2021, score: 1.3};

  // Create a Student type array
  Student[] studentList =  [s1, s2, s3];
  // Creating a Report type array from students.
  // This will return an array of reports of students whose score is above 1.
  Report[] reportList = from var student in studentList where student.score >= 1 let string degreeName = "Bachelor of Medicine", 
    int graduationYear = calGraduationYear(student.intakeYear)
    select {
      name: student.firstName,
      degree: degreeName,
      expectedGradYear: graduationYear
    };

    foreach var report in reportList {
      io:println(report);
    }

    // Creating a FullName type array
    FullName[] nameList = [];

    // Query Action
    var e = from var student in studentList
    do{
      FullName fullName = {firstName: student.firstName, lastName: student.lastName};
      nameList.push(fullName);
    };
    foreach var name in nameList {
      io:println(name);
    }
}

// This fucntion will return the graduation year by adding 5 years to the intake year.
function calGraduationYear(int year) returns int{
  return year + 5;
}