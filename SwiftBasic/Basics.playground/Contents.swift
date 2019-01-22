import UIKit

/*************************************************************************************************
 *  Swift Features
 *      - Closure
 *      - Tuples                ✅
 *      - Optional              ✅
 *      - Error Handling
 *      - High-Order Function
 *************************************************************************************************/

/* Type Annotations */
//  - To be clear about the kind of values


//var name: String        // Declare variable called name that is of type String


/*************************************************************************************************/

/* Tuples */
// - Group multiple values into single compound value
// - Values within tuple can be any type, and do NOT have to be the same type

// Difference between Tuple and Array
// Array and Tuple both can have differenct types for there values
// but, array need to do type casting if we want to use them
let arrayOfAny : [Any] = [1, "Array"]
let indexZero = arrayOfAny[0] as? Int           // need to type cast
let addIntegerToIndexZero = indexZero! + 2
print(addIntegerToIndexZero)                    // prints -> 3 :: because 1 + 2 = 3
let indexOne = arrayOfAny[1] as? String
let addStringToIndexOne = indexOne! + " needs type cast"  // print -> String type cast
print(addStringToIndexOne)

// Tuple do not need to any type casting and still can use them
let tupleTest = (1, "Tuple")
let indexZeroOfTuple = tupleTest.0              // No need to do type casting
let addIntegerToIndexZeroOfTuple = indexZeroOfTuple + 2     // prints -> 3
print(addIntegerToIndexZeroOfTuple)
let indexOneOfTuple = tupleTest.1
let addStringToIndexOneOfTuple = indexOneOfTuple + " no need type cast"
print(addStringToIndexOneOfTuple)               // prints -> Tuple no need type cast

/*************************************************************************************************/

/* Optional */
// Either there is value, or there isn't value at all which means nil

enum Optional<T> {      // generic type
    case None
    case Some(T)
}

var perhapsInt: Int?
var perhapsString: String?

perhapsInt = 4
perhapsString = "Optional String"

if perhapsInt != nil {
    print(perhapsInt)                       // prints -> Optional(4)
} else {
    print("perhapsInt has nil value")
}
if perhapsString != nil {
    print(perhapsString)                    // prints -> Optional("Optional String")
} else {
    print("perhapsString has nil value")
}

// We need to unwrap these optional values
//  - Forced Unwrapping
//  - Automatic Unwrapping
//  - Optional Binding :: if let
//  - Nil Coalescing (A ?? B)
//  - guard let

// Forced Unwrapping :: just putting exclamation mark at the end of the variable
if perhapsInt != nil {
    print(perhapsInt!)                       // prints -> 4
} else {
    print("perhapsInt has nil value")
}
if perhapsString != nil {
    print(perhapsString!)                    // prints -> Optional String
} else {
    print("perhapsString has nil value")
}

// Automatic Unwrapping :: Declare optional variable using exclamation mark instead of question mark
var automaticUnwrappingExample : String!
automaticUnwrappingExample = "Automatic Unwrapping"

if automaticUnwrappingExample != nil {
    print(automaticUnwrappingExample)
} else {
    print("automaticUnwrappingExample has nil value")
}

// Optional Binding :: if let
var optionalBindingExample: String?
optionalBindingExample = "Optional Binding"

if let optionalBindingHasValue = optionalBindingExample {
    print(optionalBindingHasValue)              // prints -> Optional Binding
} else {
    print("optionalBindingHasValue has nil value")
}

// Guard let vs if let
// - guard let have return keyword which means provide early return so it can have faster execution
// - if let do NOT have return keyword

// Nil Coalescing (A ?? B)
var nilCoalescingExample : String?
var defaultName = "Default Name"

var nameToUse = nilCoalescingExample ?? defaultName
print(nameToUse)                        // prints -> Default Name
nilCoalescingExample = "Nil Coalescing"
var nameToUse1 = nilCoalescingExample ?? defaultName
print(nameToUse1)                       // prints -> Nil Coalescing

/*************************************************************************************************/

/* Error Handling */
