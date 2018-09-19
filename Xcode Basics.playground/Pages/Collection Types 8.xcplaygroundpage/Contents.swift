//: [Previous](@previous)

import Foundation

// Swift provides three primary collection types, known as arrays, sets, and dictionaries
// Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associatiations.
// If you create an array, a set, or a dictionary, and assign it to a variable, the collection that is created will be mutable. This means that you can change the collection after it's created by adding, removing, or changing items in the collection.
// If you assign an array, a set, or a dictionary to a constant, that collection is immutable, and its size and contents cannot be changed.

// Arrays
// An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions
// The type of swift array is written fully as Array<Element>, where Element is the type of values the array is allowed to store. You can also write the type of an array in shorthand form as [Element]

// You can create an empty array of a certain type using initializer syntax:
var someInts = [Int]()
print("someInts of type [Int] with \(someInts.count) items")
// Note that the type of someInts variable is inferred to be [Int] from the type of the initializer
// Alternitavely, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty array with an empty array literal, which is written as []
someInts.append(3)
print(someInts)
// someInts now contains 1 value of type Int
someInts = []
print(someInts)
// someInts is now an empty array, but is still of type [Int]

// Creating an Array with a Default Value
// Swifts Array type also provides an initializer for creating an array of certain size with all of its values set to the same default value. You pass this initializer a default value of the appropriate type (called repeating): and the number of times that value is repeated in the new array (called count):
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

// You can create an array by adding two existing arrays with compatible types with the addition operator (+)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
print(anotherThreeDoubles)

var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

// Creating an Array with an Array Literal
// You can initialize an array with an array literal, which is a shorthand way to write one or more values as an array collection. An array literal is written as a list of values, separated by commas, surrounded by a pair of brackets.
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList is an array that can only contain String values
// You don't have to write the type of array if you're initializing it with an array literal containing the same values

// Accessing and Modifying an Array
// To find out the number of items in an array, check it read-only count property:
print("The shopping list only contains \(shoppingList.count) items")
//Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:
if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}
// You can add a new item to the end of an array by calling the array's append(_:) method:
shoppingList.append("Flour")
print(shoppingList)
// You can also add compatible items with the addition assignment operator (+=):
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingList)
// Retrieve a value from the array using subscript syntax, passing the index of the value you want to retrieve within square brackets immediately after the name of the array:
var firstItem = shoppingList[0]
print(firstItem)
// You can use subscript syntax to change an existing value at a given index
shoppingList[0] = "Six Eggs"
print(shoppingList)
// You can use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)
// To insert an item into the array at a specified index, call the array's insert(_:at:) method:
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)
// You remove an item with the remove(at:) method. This method removes the item at the specified index and returns the removed item (although you can ignore the returned value if you don't need it)
let maplesyrup = shoppingList.remove(at: 0)
print(shoppingList[0])
// If you want to remove the last item in an array, use the removeLast() method:
let apples = shoppingList.removeLast()
print(shoppingList)

// Iterating Over an Array
// You can iterate over the entire set of values in an array with the for-in loop:
for item in shoppingList {
    print(item)
}
// If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array instead
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// Dictionaries
// A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined order. Each value is associated with a unique key, which acts as its identifier for that value within the dictionary.
// Dictionary is written as Dictionary<Key, Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys
// The shorthand for dictionary is [Key: Value]

// Creating an Empty Dictionary
// Like arrays, you can create an empty dictionary of a certain type by using initializer syntax:
var namesOfIntegers = [Int: String]()
// If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, which is written as [:]
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]

// Creating a Dictionary with a Dictionary Literal
// You can initialize a dictionary with a dictionary literal which is a shorthand way to write one or more key-value pairs as a Dictionary collection
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports)

// Accessing and Modifying a Dictionary
// Find the number of items in a dictionary using its read-only count method:
print("The airports dictionary contains \(airports.count) items.")
// Use the Boolean isEmpty as a shortcut to check whether the count is equal to 0:
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty")
}
// You can add a new item to a dictionary with subscript syntax.
airports["LHR"] = "London"
print(airports)
// You can also use subscript syntax to change the value associated with a particular key:
airports["LHR"] = "London Heathrow"
print(airports)
// As an alternative for subscripting, use a dictionary's updateValue(_:forKey:) method to set or to update the value for a particular key. The updateValue(_:forKey:) method returns the old value after performing an update. This enables you to check whether or not an update took place.
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// You can also use subscript syntax to retrieve a value from the dictionary for a particular key
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("The airport is not in the airports dictionary")
}
// You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key:
airports["APL"] = "Apple International"
print(airports)
airports["APL"] = nil
print(airports)
// Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method. This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed:
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed aiports name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
print(airports)

// Iterating Over a Dictionary
// You can iterate over the key-value pairs in a dictionary with the for-in loop. Each item in the dictionary is returned as a (key, value) tuple, and you can decompose the tuple's members into temporary constants or variables as part of the iteration:
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// You can also retrieve an iterable collection of a dictionary's keys or values by accessing its keys and values properties:
for airportCode in airports.keys {
    print("Airport Code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport Name: \(airportName)")
}
// If you need to use a dictionary's keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:
let airportCodes = [String](airports.keys)
print(airportCodes)
let airportNames = [String](airports.values)
print(airportNames)
