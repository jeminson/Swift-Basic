import UIKit


/*  High Order Function Simple Examples */



/* Map - Loops over collection and applies the same operation to each element in collection */
let nameArray : [String] = ["Je Min ", "Yeji", "David", "Andrew"]
let countResult = nameArray.map( {$0.count} )
print(countResult)          // prints "[7, 4, 5, 6]"

let lowercastNames = nameArray.map( {$0.lowercased()} )
print(lowercastNames)       // prints ["je min ", "yeji", "david", "andrew"]

/* flatMap - deal with optional */
var a1: String? = "a1"
var a2: String? = "a2"
var a3: String? = "a3"

var array = [a1, a2, a3]
print(array)                // prints [Optional("a1"), Optional("a2"), Optional("a3")]
var newArray = array.flatMap( {$0} )    // use compactMap instead
print(newArray)             // prints ["a1", "a2", "a3"]

/* filter */
let array2 = [1,2,3,4,5]
let filteredArray = array2.filter( {$0 < 3} )
print(filteredArray)        // prints [1, 2]

/* sort */
var student = ["Kofi", "Abena", "Peter", "Kweku", "Bee"]
let sortedStudent = student.sorted()
print(sortedStudent)        // prints ["Abena", "Bee", "Kofi", "Kweku", "Peter"]


/* Reduce - to combine all items in the collection to create single new value */
let itemArray = [2.0, 4.0, 6.0, 5.0, 3.0]
let total = itemArray.reduce(20, +)         // 20 + 20 = 40
print(total)                // prints 40.0


/* Another Reduce */
let codes = ["abc","def","ghi"]
let text = codes.reduce("", +)
print(text)                 // prints abcdefghi


/* Chaining - combine all these higher order functions */
let arrayInArray2 = [[11,12,13], [14,15,16]]
var newValue = arrayInArray2.flatMap({$0}).filter( {$0 % 2 == 0} ).map( {$0 * $0} )
// flatMap prints: [11,12,13,14,15,16]
// filter prints: [12,14,16]
// map prints: [144, 196, 256]
print(newValue) // prints [144, 196, 256]
