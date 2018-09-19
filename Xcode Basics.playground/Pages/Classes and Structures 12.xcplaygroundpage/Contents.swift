//: [Previous](@previous)

import Foundation

// Classes and Structures are general purpose, flexible constructs that become the building blocks of your programs code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.

// Here's an example of a structure definition and a class definition
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resoltution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Class and Structure Instances
// The Resolution structure definition and the VideoMode definition only describe what a Resolution or VideoMode will look like. They themselves do not describe a specific resolution or video mode. To do that, you need to create an instance of the structure or class.
// The syntax for creating instances is very similar for both structures and classes:
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing Properties
// You can access the properties of an instance using dot syntax. In dot syntax, you write the property name immediately after the instance name, separated by a period (.) without any spaces.
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resoltution.width)")
someVideoMode.resoltution.width = 1280
print("The eidth of someVideoMode is now \(someVideoMode.resoltution.width)")

// Memberwise Initializers for Structure Types
// All structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the member initializer by name:
let vga = Resolution(width: 640, height: 480)

// Structures and Enumerations are Value Types
// A value type is a type whose value is copied when it is assigned to a variable or constant, or when its passed to a function
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")
// The same behavior applies to enumerations:
enum CompassPoint {
    case north, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered directions is still .west")
}
// When rememberedDirection is assigned a value of currentDirection, it is actually set to a copy of that value. Changing the value of currentDirection thereafter does not affect the copy of the original value that was stored in rememberDirection.

// Classes are Reference Types
// Unlike value types, reference types are not copied when they are assigned to a variable or a constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead
let tenEighty = VideoMode()
tenEighty.resoltution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// Identity Operators
// Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes.
// It can be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators: identical to (===) and not identical to (!==)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance")
}

