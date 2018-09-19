//: [Previous](@previous)

import Foundation

// A string literal is a sequence of characters surrounded by double quotation marks
let someString = "Some string literal value"

// Multiline string literals
let quotation = """
The white rabbit put on his spectacles. "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, " and go on \
till you come to the end; then stop."
"""
print(quotation)
// The \ are line breaks that make the source code easier to read that are not a part of the string's value

let lineBreaks = """

This string starts with a line break.
It also ends with a line break>

"""

print(lineBreaks)

let linesWithIndentation = """
This line doesn't begin with whitespace.
    This line brings with four spaces.
This line doesn't begin with whitespace.
"""
print(linesWithIndentation)

// String literals can include the following special characters:
/* - The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed),
 \r (carriage return), \" (double quotation mark) and \' (single quotation mark)
 -  An arbitrary Unicode scalar, written as \u{n}, where n is a 1-8 digit hexadecimal number with a value equal
 to a valid Unicode code point
 */
print(" ")

let wiseWords = "\"Imagination is more important that knowledge\" - Einstein"
print(wiseWords)
let dollarSign = "\u{24}"
print(dollarSign)
let blackHeart = "\u{2665}"
print(blackHeart)
let sparklingHeart = "\u{1F496}"
print(sparklingHeart)

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)
print(" ")

// Initializing an Empty String
// To create an empty string value as the starting point for building a longer string, either assign an empty string literal to a variable, or initialize a new string instance with initializer syntax:
var emptyString = ""        // empty string literal
var anotherEmptyString = String()       // initializer syntax
if emptyString.isEmpty{
    print("Nothing to see here")
}
print(" ")

// String Mutability
// You can indicate whether a particular string can be modified (or mutated) by assigning it to a variable (in which case it can be modified), or to a constant (in which case it can't be modified)
var variableString = "Horse"
variableString += " and carriage"
print(variableString)
print(" ")

// Working with characters
// You can access the individual character values for a string by iterating over the string with a for-in loop:
for character in "Dog!" {
    print(character)
}
// You can create a stand-alone character constant or variable from a single-character string literal by providing  a character type annotation:
let exclamationMark: Character = "!"
print(exclamationMark)
// String values can be constructed by passing an array of character values as an argument to its initializer:
let catCharacters: [Character] = ["C", "A", "T", "!"]
let catString = String(catCharacters)
print(catString)

// Concatenating String and Characters
// String values can be added together (or concatenated) with the addition operator (+) to create a new string value:
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
print(welcome)
// You can also append a string value to an existing string variable with the addition of the addition assignment operator (+=)
var instruction = "look over"
instruction += string2
print(instruction)
// You can append a character value to a string variable with the string type's append() method:
welcome.append(exclamationMark)
print(welcome)
// You can't append a string or character to an existing character variable, because a character value must contain a single character only
print(" ")
// If you're using multiline string literals to build up the lines for a longer string, you want every line in the string to end with a line break, including the last line. For example:
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
print("")
let goodStart = """
one
two

"""
print(goodStart + end)
// In the code above, concatenating badStart with end produces a two-line string, which isn't the desired result. Because the last line of badStart doesn't end with a line break, that line gets combined with the first line of end. In contrast, both lines of goodStart end with a line break, so when it's combined with end the result has three lines.

// String Interpolation
// String interpolation is a way to construct a new string value from a mix of constants, variables, literals, and expressions by including their values inside a string literal. You can use string interpolation in both single-line and multiline string literals. Each item you insert into the string literal is wrapped in a pair of parentheses, prefixed by a backslach(\)
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)
// This expression calculates the value of Double(multiplier) * 2.5 and inserts the result of (7.5) into the string. In this case, the expression is written as \(Double(multiplier) * 2.5) when it's included inside the string literal.
// The expressions you write inside parentheses within an interpolated string can't contain an unescaped backslash(\), a carriage return, or a line feed. However, they can contain other string literals.

// You access and modify a string through its methods and properties, or by using subscript syntax

// String Indices
// Each string value has an associated index type, String.Index, which corresponds to the position of each character in the string
// Use the startIndex property to access the position of the first character of a string. The endIndex property is the position after the last character in a String. As a result, the endIndex properry isn't a valid argument to a string's subscript. If a string is empty, startIndex and endIndex are equal.
// You access the indices before and after a given index using the index(before:) and index(after:) method of String. To access an index farther away from the given index, you can use the index(_:offsetBy:) method instead of calling one of these methods multiple times
// You can use subscript syntax to access the character at a praticular string index
let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])
print(greeting[greeting.index(before: greeting.endIndex)])
print(greeting[greeting.index(after: greeting.startIndex)])
//let index = greeting.index(greeting.startIndex, offsetBY: 7)

// Use the indices property to access all of the indices of individual characters in a string
for index in greeting.indices {
    print("\(greeting[index])", terminator: "")
}
print("")
// Inserting and Removing
// To insert a single character into a string at a specified index, use the insert(_:at:) method, and to insert the contents of another string at a specified index, use the insert(contentsOf:at:) method.
var firstAddress = "hello"
firstAddress.insert("!", at :firstAddress.endIndex)
firstAddress.insert(contentsOf: " there", at: firstAddress.index(before: firstAddress.endIndex))
print(firstAddress)
// To remove a single character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the removeSubrange(_:) method:
firstAddress.remove(at: firstAddress.index(before: welcome.endIndex))
print(firstAddress)
let range = firstAddress.index(firstAddress.endIndex, offsetBy: -6)..<firstAddress.endIndex
firstAddress.removeSubrange(range)
print(firstAddress)

// Substrings
// You use substrings for only a short amount of time while performing actions on a string
// When you're ready to store the result for a longer time, you convert the substring to an instance of string
let greet = "Hello, world!"
let index = greet.index(of: ",") ?? greet.endIndex
// ?? means if the first condition isn't met, run the second condition
let beginning = greet[..<index]
print(beginning)
let newString = String(beginning)
print(newString)
// Each substring has a region of memory where the characters that make up the substring are stored.
// The difference between string and substring is that, as a performance optimization, a substring can reuse part of the memory that's used to store the original string, or part of the memory that's used to store another substring
// In the example above, greet is a string, which means it has a region of memory where the characters that make up the string are stored. Because beginning is a substring of greet, it reuses the memory that greeting uses. In contrast, newString is a string - when it's created from the substring, it has its own storage.

// Comparing Strings
// Swift provides three ways to compare textual values: string and character equality, prefix equality, and suffix equality
// String and Character Equality
// String and character equality is checked with the "equal to" operator (==) and the "not equal to) operator (!=)
let saying = "We're a lot alike, you and I."
let sameSaying = "We're a lot alike, you and I."
if saying == sameSaying {
    print("These two strings are considered equal")
}
// Two string values (or two character values) are considered equal if their extended grapheme clusters are canonically equvialent. Extended grapheme clusters are canonically equivalent if they have the same liguistic meaning and appearance, even if they're composed from different Unicode scalars

// Prefix Equality
// To check whether a string has a particular string prefix or suffix, call the string's hasPrefix(_:) and hasSuffix(_:) methods, both of which take a single argument of type String and return a Boolean value
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, a public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Fria Lawrence's cell"
]
// You can use the hasPrefix(_:) method with the romeoAndJuliet array to count the number of scenes in Act 1:
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) in Act 1")
var act2SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 2") {
        act2SceneCount += 1
    }
}
print("There are \(act2SceneCount) in Act 2")
// Similarily, use the hasSuffix(_:) method to count the number of scenes that take place in or around Capulet's mansion and Friar Lawerence's cell
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
