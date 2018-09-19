//: [Previous](@previous)

import Foundation

// Tuples group multiple values into a single compound value.
// The values within a tuple can be of any type and don't have to be of the same type as eachother
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

// You can decompose a tuple's contents into separate constants or variables, which you can then access as usual:
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// If you only need some of the tuple's values, ignore parts of the tuple with an underscore (_) when you
// decompose the tuple
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

// Alternatively, access the individual element values in a tuple using index numbers starting at zero:
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statuscode: 200, description: "OK")
// If you name the elements in a tuple, you can use the element names to access the values of those elements:
print("The status code is \(http200Status.statuscode)")
print("The status message is \(http200Status.description)")

