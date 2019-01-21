import UIKit

struct FixedLengthRange {   // Instance of FixedLengthRange
    var firstValue: Int     // variable stored property
    let length: Int         // constant stored property
}

// length is initialized when new range is created and cannot be changed
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)          // range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6                                            // range represents integer values 6, 7, and 8
//rangeOfThreeItems.length = 5                                              // Not possible because length is constant

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)           // range represents integer values 0, 1, 2, and 3
// rangeOfFourItems.firstValue = 6                                          // Not possible because instance of struct is assigned to constant


// Struct -> value type :: when instance of value type is marked as constant, then all of its properties are also constant
// Class -> reference type :: if you assign instance of reference type to constant, you can still change that instance's variable properties

class FixedLengthRangeClass {
    var firstValue: Int
    let length: Int
    
    init(firstValue: Int, length: Int) {
        self.firstValue = firstValue
        self.length = length
    }
}

let rangeOfFiveItems = FixedLengthRangeClass(firstValue: 0, length: 5)
rangeOfFiveItems.firstValue = 6


var a: String {
    return "a"
}

print(a)
