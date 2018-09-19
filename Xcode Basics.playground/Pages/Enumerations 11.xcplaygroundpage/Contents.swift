//: [Previous](@previous)

import Foundation

// An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.
// Enumerations in Swift are flexible, and do not have to provide a value for each case of the enumeration. If a value (known as a "raw" value) is provided for each enumeration case, the value can be a string, a character, or a value of any integer or floating-point type.
// Alternatively, enumeration cases can specify associated values of any type to be stored along with each different case value, much as unions or variants do in other languages. You can define a common set of related cases as part of one enumeration, each of which has a different set of values od appropriate types associated with it.

// Enumeration Syntax
enum SomeEnumeration {
    // enumeration definition goes here
}
enum CompassPoint {
    case north
    case south
    case east
    case west
}
// The values defined in an enumeration (such as north, south, east, west) are its enumeration cases. You use the case keyword to introduce new enumeration cases.

// Multiple cases can appear on a single line, separated by commas.
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
// The type of directionToHead is inferred when it is initialized with one of the possible values of CompassPoint. Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax:
directionToHead = .east
// The type of directionToHead is already known, and so you can drop the type when setting its value. This makes for highly readable code when working with explicitly typed enumeration values

// Matching Enumeration Values with a Switch Statement
// You can match individual enumeration values with a switch statement:
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north.")
case .south:
    print("Watch out for penguins.")
case .east:
    print("Where the sun rises.")
case .west:
    print("Where the skies are blue.")
}
// When its not appropriate to provide a case for every enumeration case, you can provide a default case to cover any cases that are not addressed explicitly:
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless.")
default:
    print("Not a safe place for humans.")
}

// Associated Values
// You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed. Enumerations similar to these are known as discriminated unions, tagged unions, or variants in other programming languages.
// In Swift, an enumeration to define product barcodes of either type might look like this:
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
// New barcodes can then be created using either type:
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}
// If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the name case
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}

// Raw Values
// Raw values can be strings, characters, or any of the integer or floating point number types. Each raw value must be unique within its enumeration declaration

// Implicitly Assigned Raw Values
// When working with enumerations that store integer or string raw values, you don't have to explicitly assign a raw value for each case.
enum Planets: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// In the example above, Planet.mercury has an explicit value of 1, Planet.venus has an implicit raw value of 2, and so on.

enum CompassPoints: String {
    case north, south, east, west
}
// In the example above, CompassPoint.south has an implicit raw value of "south", and so on.
// You access the raw value of an enumeration case with its rawValue property
let earthsOrder = Planets.earth.rawValue
let sunsetDirection = CompassPoints.west.rawValue

// Initializing from Raw Value
// If you define an enumeration with a raw value type, the enumeration automatically receives an initializer that takes a value of the raw value's type (as a parameter called rawValue) and returns either an enumeration case or nil.
let possiblePlanet = Planets(rawValue: 7)

// If you try to find a planet with a position of 11, the optional Planet value returned by the raw value initializer will be nil:
let positionToFind = 11
if let somePlanet = Planets(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// Recursive Enumerations
// A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more enumeration cases. You indicate that an enumeration is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection
// For example, an enumeration that stores simple arithmetic expressions:
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// You can also write indirect before the beginning of the enumeration to enable indirection for all the enumeration cases that have an associated value

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
// A recursive enumeration is a straightforward way to work with data that has a recursive structure.
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .mupltiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
