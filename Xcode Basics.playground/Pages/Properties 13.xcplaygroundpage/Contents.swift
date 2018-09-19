//: [Previous](@previous)

import Foundation

// Properties
// Properties asscoiate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are only provided by classes and structures.

// Stored Properties
// In its simplest form, a stored property is a constant or variable that is stored as part of an instance of a particular class or structure.
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, 2
rangeOfThreeItems.firstValue = 6
// the range now represents 6, 7, 8
print(rangeOfThreeItems)

// You can create an instance of structure and assign that instance to a constant, you cannot modify the instance's properties, even if they are declared as variable properties
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// the range represents integer values 0,1,2, and 3
//rangeOfFourItems.firstValue = 6
// this will report an error, even though the firstValue is a variable property
// Because rangeOfFourItems is declared as a constant (with the let keyword), it is not possible to change it firstValue property, even though firstValue is a variable property. This behavior is due to structures being value types. When an instance of a value type is marked as constant, so are all of its properties.

// Lazy Stored Properties
// A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
// You must always declare a lazy property as a variable with with var keyword
// Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance's initialization is complete. Lazy properties are also useful when the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until it is needed.

class DataImporter {
    var filename = "data.txt"
}
// DataImporter is a class to import data from an external file. The class is assumed to take a nontrivial amount of time to initialize.
// The DataImporter class would provide data importing functionality here

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
// the DataImporter instance for the importer property has not yet been created

print(manager.importer.filename)

// Computed Properties
// In addition to stored properties, classes, structures, and enumerations can define computed properties, which do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("sqaure.origin is now at (\(square.origin.x), \(square.origin.y))")
// This example defines three structures for working with geometric shapes:
// - point encapsulates the x and y coordinate of a point
// - size encapsulates a width and a length
// - rect defines a rectangle by an origin point and a size

// Shorthand Setter Declaration
// If a computed property's setter does not define a name for the new value to be set, a default name of newValue is used

struct AlternativeRect {
    var origin = Point()
    var size = Size ()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// Read-Only Computed Properties
// A computed property with a getter but no setter is known as read-only computed property. A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value
// You can simplify the declaration of a read-only computed property by removing the get keyword and its braces
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume : Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// Property Observers
// Property observers observe and respond to changes in a property's value. Property observers are called every time a property's value is set, even if the new value is the same as the property's current value.
// You can add property observers to any stored properties you define, except for lazy stored properties
// You have the option to define either or both of these observers on a property:
// - willSet is called just before the value is stored
// - didSet is called immediately after the new value is stored
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
// The StepCounter class declares a totalSteps property of type Int. This is a stored property with willSet and didSet observers. The willSet and didSet observers for totalSteps are called whenever the property is assigned a new value

// Global and Local Variables
// The capabilities for computing and observing properties are also available to global and local variables. Global variables are variables that are defined outside of any function, method, closure, or type context. Local variables are variables that are defined within a function, method, or closure context.

// Type Properties
// Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.
// Type properties are useful for defining values that are universal to all instances of a particular type, such as a constant property that all instances can use, or a variable property that stores a value that is global to all instances of that type

// Type Property Syntax
// Type properties are written as part of the type's definition, within the type's outer curly braces, and each type property is explicitly scoped to the type it supports
// You define type properties with the static keyword. For computed type properties for class types, you can use the class keyword instead to allow subclasses to override the superclass's implementation.
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// Querying and Setting Type Properties
// Type properties are queried and set with dot syntax, just like instance properties. However, type properties are queried and set on the type, not on an instance of that type
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


