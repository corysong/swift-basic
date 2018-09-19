//: [Previous](@previous)

import Foundation

// Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You can use subscripts to set and retrieve values by index without needing separate methods for setting and retrieving.

// Subscripts Syntax
// Subscripts enable you to query instances of a type by writing one or more values in square brackets after the instance name.

// An example of a read only subscript
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("6 times 3 is \(threeTimesTable[6])")

// Subscripts can take any number of input parameters, and these input parameters can be of any type. Subscripts can also return any type. Subscripts can use variadic parameters, but they can't use in-out parameters or provide default parameter values.

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
// Matrix provides an initializer that takes two parameters called rows and columns, and makes an array that is large enough to store rows * columns values of type Double.








