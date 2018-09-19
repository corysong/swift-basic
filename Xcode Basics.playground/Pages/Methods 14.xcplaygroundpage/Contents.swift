//: [Previous](@previous)

import Foundation

// Methods are functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type. Classes, structures, and enumerations can also define type methods, which are associated with the type itself.

// Instance Methods
// Instance methods are functions that belong to instances of a particular class, structure, or enumeration. They support the functionality of those instances, either providing ways to access and modify instance properties, or by providing functionality related to the instance's purposes
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
// The Counter class defines three instance methods:
// - increment() increments the counter by 1
// - increment(by: Int) increments the counter by a specified integer amount
// - reset() resets the counter to 0

// The Counter class also declares a variable property, count, to keep track of the current counter value
let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

// The self Property
// Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself. You use the self property to refer to the current instance within its own instance methods

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// Modifying Value Types from Within Instance Methods
// Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods. However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method.
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// The Point2 structure above defines a mutating moveBy(x:y:) method, which moves a Point2 instance by a certain amount. Instead of returning a new point, this method actually modifies the point on which it is called. The mutating keyword is added to its definition to enable it to modify its properties.
// You cannot call a mutating method on a constant of structure type, because its properties cannot be changed, even if they are variable properties

// Assigning to self Within a Mutating Method
// Mutating methods can assign an entirely new instance to the implicit self property.
/*struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}
 */

// Mutating methods for enumerations can set the implicit self parameter to be a different case for the same enumeration
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

// Type Methods
// Instance methods are methods that are called on an instance of a particular type. You can also define methods that are called on the type itself. You indicate type methods by writing the static keyword before the method's func keyword. Classes may also use the class keyword to allow subclasses to override the superclass's implementation of that method.

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {highestUnlockedLevel = level}
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}
// The LevelTracker structure keeps track of the highest level that any player has unlocked. This value is stored in a type property called highestUnlockedLevel.

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now level 6")
} else {
    print("level 6 has not yet been unlocked")
}
