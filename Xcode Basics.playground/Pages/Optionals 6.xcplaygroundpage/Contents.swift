//: [Previous](@previous)

import Foundation

/* 1. WHY:
 - Login screen: Username and Password Input. Guard is the optional
 username: asdasdasd
 password: adslja
*/
// You can use optionals in situations where are value may be absent. An optional represents two possibilites:
// Either there is a value, and you can wrap the optional to access that value, or there isn't a value at allaccess

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

// You can set an optional variable to a valueless state by assigning it the special value nil:
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value
// You can't use nil with nonoptional constants or variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type

// If you define an optional value without providing a default value, the variable is automatically set to nil for you:
var surveyAnswer: String?
// surveryAnswer is autoautomatically set to nil
// In Swift, nil isn't a pointer - it's the absence of of a value of a certain type. Optionals of any type can be set to nil

// nil = empty storage but somethings exists.

// If an optional has a value, it's considered to be "not equal to" nil:
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

//Optional Binding
// You can use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable
// if let constantName = someOptional {
// statements
//}
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

