//: [Previous](@previous)

import Foundation

// Functions are self-contained chunks of code that perform specific tasks.

// Defining and Calling Functions
// When you define a function, you can optionally define one or more named, typed values that the function takes as input, known as parameters. You can also optionally define a type of value that the function will pass back as output when its done, known as its retuen type.
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

// Function Parameters and Return Values
// You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options

// Functions without Parameters
// Functions are not required to define input parameters.
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

// Functions with Multiple Parameters
// Functions can have multiple parameters, which are written within the function's parantheses, separated by commas.
// This function takes a person's name and whether they have already been greeted as input, and returns an appropriate greeting for that person:
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

// Functions without Return Values
// Functions are not required to define a return type.

func greet1(person: String) {
    print("Hello, \(person)")
}
greet1(person: "Dave")
// Because it does not need to return a value, the funtion's definition does not include the return arrow (->) or a return type.

// The return value of a function can be ignored when it is called:
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// Functions with Multiple Return Values
// You can use a tuple type as a return type for a function to return multiple values as part of one compound return value.
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min), and max is \(bounds.max)")

// Optional Tuple Return Types
// If the tuple type to be returned from a function has the potential to have "no value" for the entire tuple, use an optional tuple return type to reflect the fact that the entire tuple can be nil. You write an optional tuple return type by placing a question mark after the tuple's closing parantheses.
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds1 = minMax1(array: [8, -6, 2, 109, 3, 71 ]) {
    print("min is \(bounds1.min), and max is \(bounds1.max)")
}

// Function Argument Labels and Parameter Names
// Each function parameter has both an argument label and a parameter name. The argument label is used when calling the function; each argument is written in the function call with its argument label before it.
// The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.
func someFunction(firstParameterName: Int, secondParameterName: Int) {
}
someFunction(firstParameterName: 1, secondParameterName: 2)

// Specifying Argument Labels
// You write an argument label before the parameter name, separated by a space:
func someFunction1(argumentLabel parameterName: Int) {
}
// Variation of the greet(person:) function:
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

// Omitting Argument Labels
// If you don't want an argument label for a parameter, write an underscore(_) instead of an explicit argument label for that parameter
func someFunction2(_ firstParameterName: Int, secondParameterName: Int) {
}
someFunction2(1, secondParameterName: 2)

// Default Parameter Values
// You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter's type. If a default value is defined, you can omit that parameter when calling the function

// Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type. Use variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called. Write varadic parameters by inserting three period characters (...) after the parameter's type name
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

// In-Out Parameters
// Function parameters are constants by default. Trying to change the value of a function parameter from within the body of the function results in compile-time error. This means you can't change the value of a parameter by mistake. If you want to modify a parameter's value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// The swapTwoInts (_:_:) functions simply swaps the value of b to a, and the value of a to b. The function performs this swap by storing the value of a in a temporary constant called temporaryA, assigning the value of b to a, and then assigning temporaryA to b.
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// Function Types
// Every function has a specific function type, made up of the parameter types and the return type of the function
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
// This function has no parameters or return values
func helloWorld() {
    print("hello world")
}

// Using Function Types
// You can use function types just like any other types in Swift. For example, you can define a constant or variable to be a function type and assign an appropriate function to that variable
var mathFunction: (Int, Int) -> Int = addTwoInts
// This is read as "Define a variable called mathFunction, which has a type of 'a function that takes two Int values, and returns an Int value.' Set this new variable to refer to the function called addTwoInts"
print("Results: \(mathFunction(2, 3))")
print("Results: \(mathFunction(10, 10))")
// A different function with the same matching type can be assigned to the same variable, in the same way as for nonfunction types
mathFunction = multiplyTwoInts
print("Results: \(mathFunction(2, 3))")
// As with any other type, you can leave it to Swift to infer the function type when you assign a function to a constant or variable
let anotherMathFunction = addTwoInts

// Function Types as Parameter Types
// You can use a function type such as (Int, Int) -> Int as a parameter type for another function. THis enables you to leave some aspects of a function's implementation for the function's caller to provide when the function is called
func printMathResults(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Results: \(mathFunction(a, b))")
}
printMathResults(addTwoInts, 3, 5)
printMathResults(multiplyTwoInts, 3, 5)

// Function Types as Return Types
// You can use a function type as the return type of another function. You do this by writing a complete function tyoe immediately after the return arrow (->) of the returning funtion.
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int{
    return backward ? stepBackward : stepForward
}
// You can now use chooseStepFunction(backward:) to obtain a function that will step in one direction or the other
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// currentValue has an initial value of 3, which means that currentValue > 0 is true, causing chooseStepFunction(backward:) to return the stepBackward(_:) function. A reference to the returned function is stored in a constant called moveNearerToZero.
print("Counting to 0:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("0!")

// Nested Functions
// All of the functions you have encountered so far in this chapter have been examples of global functions, which are defined at a global scope. You can also define functions inside the bodies of other functions, known as nested functions.
// Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.
// You can rewrite the chooseStepFunction(backward:) example above to use and return nested functions:
func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    return backward ? stepBackward : stepForward
}
var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction1(backward: currentValue1 > 0)
// moveNearerToZero1 now refers to the nested stepForward() function
while currentValue1 != 0 {
    print("\(currentValue1)...")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("0!")
