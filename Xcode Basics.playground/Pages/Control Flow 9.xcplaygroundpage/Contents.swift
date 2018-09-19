//: [Previous](@previous)

import Foundation

// Swift provides a variety of control flow statements. These include while loops to perform a task miltiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code.

// For-In Loops
// You use for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string.
let names = ["Marco", "Min", "Will", "Jerry"]
for name in names {
    print(name)
}
// You can also iterate over a dictionary to access its key-value pairs:
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// You can also use for-in loops with numberic ranges:
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// If you don't need each value from a sequence, you can ignore the values by using an underscore in place of a variable name:
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// Sometimes, you might not want to use closed ranges, which include both endpoints. Use the hald-open range operator (..<) to include the lower bound but not the upper bound.
let minutes = 60
for tickMark in 0..<minutes {
    print(tickMark)
}
// Some might want fewer tick marks in their UI. Use the stride(from:to:by) function to skip unwanted marks.
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}
// Closed ranges are also available, by using stride(from:through:by) instead:
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print(tickMark)
}

// While Loops
// A while loop performs a set of statements until a condition becomes false. These loops are best used when the number of iterations is not known before the first iteration begins.
// - while loops evaluate its condition at the start of each pass through the loop
// - repeat-while evaluates its condition at the end of each pass through

// While
// A while loop starts by evaluating a single condition. If the condition is true, a set of statements is repeated until the condition becomes false
var finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    // move by the rolled amount
    square += diceRoll
    if square < board.count{
        // If we're still on the board, move up ir down for snake or ladder
        square += board[square]
    }
}
print("Game Over!")
// Repeat-While
// The other variation of the while loop performs a single pass through the loop block first, before considering the loops condition. It then continues to repeat the loop until the condition is false.

// Conditional Statements
// Use the if statement to evaluate simple conditions with only a few possible outcomes. The switch statement is better suited to more complex conditions with multiple possible permutations and is useful in situations where pattern matching can help select an appropriate code branch to execute.

// If
// In its simplest form, the if statement has a single if condition. It executes a set of statements only if that condition is true.
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// The if statement can also provide an alternative set of statements, known as an else clause, for situations when the if condition is false.
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// You can chaing multiple if statements together to consider additional clauses
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
// Because the temperature is neither too cold not too warm to trigger the if or else if conditions, no message is printed.

// Switch
// A switch statement considers a value and compares it against several possible matching patterns. It then executes an appropriate block of code, based on the first pattern that matches successfully. A switch statement provides an alternative to the if statement for responding to multiple potential states.
// In its simplest form, a switch statement compares a value against one or more values of the same type.
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// The body of each must contain at least one executable statement.
// To make a switch with a single case that matches both "a" and "A", combine the two values into a compound case, separating the values with commas:
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Interval Matching
// Values in switch cases can be checked for their inclusion in an interval. This example uses number intervals to provide a natural-language count for numbers of any size:
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "No"
case 1..<5:
    naturalCount = "A few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings)")

//Tuples
// You can use tuples to test multiple values in the same switch statement. Each element of the tuple can be tested against different value or interval of values. Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value.
// The example below takes na (x,y) point, expressed as a simple tuple of type (Int, Int), and categorizes it on the graph that follows the example
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside the box")
}

// Value Bindings
// A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as value binding, because the values are bound to temporary constants or variables within the case's body.
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// Where
// A switch case can use a where clause to check for additional conditions
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Compound Cases
// Multiple switch cases that share the same body can be combined by writing several patterns after case, with a comma between each of the patterns. If any of the patterns match, then the case is considered to match. The patterns can be written over multiple lines if the list is long.
let yetAnotherCharacter: Character = "e"
switch yetAnotherCharacter {
case "a", "e", "i", "o", "u":
    print("\(yetAnotherCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(yetAnotherCharacter) is a consonant")
default:
    print("\(yetAnotherCharacter) is neither a vowel nor a consonant")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

// Control Transfer Statements
// Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another.
// - continue, break, fallthrough, return, throw

// Continue Transfer Statement
// This tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let characterToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if characterToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
// The code above calls the continue keyword whenever it matches a vowel or a space, causing the current iteration of the loop to end immediately and to jump straight to the start of the next iteration

// Break Transfer Statement
// The break statement ends execution of an entire control flow statement immediately. The break statement can be used inside a switch or loop statement when you want to terminate the execution of the switch or loop statement earlier than would otherwise be the case.

// Fallthrough Transfer Statement
// The fallthrough keyword cause code execution to move directly to the statements inside the next case (or default case) block
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer"
}
print(description)

// Labeled Statements
// You mark a loop statement or conditional statement with a statement label to be explicit about with loop or conditional statement you want to break or continue.
finalSquare = 25
board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will take use to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game Over")

// Early Exit
// A guard statement, like an if statement, executes depending on the Boolean value of an expression. You use guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else cause - the code inside the else clause is executed if the condition is not true
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}
greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])

// Checking API Availability
// Swift has a built in support for checking API availability, which ensures that you don't accidentally use APIs that are unavailable on a given deployment target

