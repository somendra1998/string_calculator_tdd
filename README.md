# String Calculator

A simple string calculator designed to support:
- Basic addition of numbers separated by commas.
- Handling of newlines as delimiters.
- Support for custom delimiters, including multi-character delimiters.
- Throwing exceptions for negative numbers and ignoring numbers greater than 1000.

## Features
- **Basic Addition**: Add numbers separated by commas (e.g., `1,2`).
- **Newline Support**: Handle newlines between numbers as delimiters (e.g., `1\n2,3`).
- **Custom Delimiters**: Allow the user to specify a custom delimiter using `//[delimiter]` (e.g., `//;\n1;2`).
- **Negative Numbers**: Throws an exception for negative numbers with a message like `negatives not allowed: -2`.
- **Number Ignoring**: Numbers greater than 1000 are ignored in the sum.
- **Delimiter Flexibility**: Support delimiters of any length (e.g., `//[***]\n1***2***3`).

## Installation

To run this project locally, follow these steps:

1. Clone the repository:
On terminal
   git clone https://github.com/your-username/string_calculator.git
   cd string_calculator
2. Install dependencies:
    On terminal
    bundle install

## Usage

**Running the calculator**
To use the StringCalculator class, simply call the add method with a string of comma-separated or newline-separated numbers:

StringCalculator.add("1,2,3")
# => 6


**Custom Delimiters**
To use a custom delimiter, specify it at the start of the string:
StringCalculator.add("//;\n1;2")
# => 3

**Handling Negative Numbers**
The calculator throws an exception for negative numbers:
StringCalculator.add("1,-2,3")
# => raises error: "negatives not allowed: -2"

**Ignoring Numbers Greater Than 1000**
Numbers greater than 1000 are ignored in the sum:
StringCalculator.add("2,1001")
# => 2

**Multi-Character Delimiters**
You can use delimiters of any length by specifying them in the header:
StringCalculator.add("//[***]\n1***2***3")
# => 6


**Running Tests**
To run the tests with RSpec, use the following command:
rspec





