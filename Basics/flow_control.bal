import ballerina/io;

public function main() {
  int a = 5;
  int b = 0;

  // If statement
  if (a == 5) {
    io:println("a is equal to 5.");
  }

  // If-else statement
  if (a > b) {
    io:println("a is greater than b.");
  } else {
    io:println("b is greater than a.");
  }

  // If-elseif-else statement
  if(b > 0){
    io:println("b is a positive number.");
  } else if (b < 0) {
    io:println("b is negative.");
  } else {
    io:println("b is zero.");
  }

  // While statement
  int i = 0;
  while (i < 10) {
    // This will ignore number 3 and continue to number 4.
    if (i == 3) {
      i += 1;
      continue;
    }
    
    io:println(i);
    i += 1;

    // This will stop the loop when i = 5.
    if (i == 5) {
      break;
    }
  }

  // foreach statement
  //creating a string array.
  string[] games = ["Sudoku", "Ludo", "Mahjongg"];
  // Printing items using foreach
  foreach string game in games {
    io:println("Game: ", game);
  }

  // Iterating through an integer range
  int endVal = 20;
  int sum = 0;
  foreach var index in 1 ... endVal {
    sum += index;
  }
  io:println(sum);

  // Iterating through an integer range, end value excluded
  sum = 0;
  foreach var index in 1 ..< endVal {
    sum += index;
  }
  io:println("Sum of 1 to 19 is: ", sum.toString());

  // match statement
  string[] strArray = ["Man", "Woman", "Dog"];
  foreach var item in strArray {
    match item {
      // Code to execute if item = "Man"
      "Man" => {
        io:println("This is a man.");
      }
      // Code to execute if item = "Woman"
      "Woman" => {
        io:println("This is a woman");
      }
      // Code to execute if item is not equal to "Man" or "Woman"
      _ => {
        io:println("This is an animal.");
      }
    }
  }
}