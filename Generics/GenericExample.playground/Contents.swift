import UIKit

/* https://www.appcoda.com/swift-generics/ */

/* Generic code enables you to write flexibe, reusable functions and types that can work with any type
 
    Swift's Array and Dictionary types are both generic collections
 */

func existsManual(item: String, inArray: [String]) -> Bool {
    var index: Int = 0
    var found: Bool = false
    
    while (index < inArray.count && found == false) {
        if item == inArray[index] {
            found = true
        } else {
            index = index + 1
        }
    }
    
    if found {
        return true
    } else {
        return false
    }

}

let strings = ["JeMin", "Yeji", "David"]
let nameExistsInArray = existsManual(item: "JeMin", inArray: strings)
print(nameExistsInArray)        // prints "true"
let nameExistsInArray1 = existsManual(item: "Paul", inArray: strings)
print(nameExistsInArray1)        // prints "false"


// Write above function with Generic to make it able to work with any type
// Use placeholder type <T> instead of actual type(such as Int, String, or Double)

// <T: Equatable> :: type constraints
// Equatable protocol is for "A type that can be compared for value equality"
func exists<T: Equatable> (item: T, inArray: [T]) -> Bool {
    var index: Int = 0
    var found: Bool = false
    
    while (index < inArray.count && found == false) {
        if item == inArray[index] {
            found = true
        } else {
            index = index + 1
        }
    }
    
    if found {
        return true
    } else {
        return false
    }
}

let myFriends:[String] = ["Jemin", "Yeji", "David"]
let isOneOfMyFriends = exists(item: "Jemin", inArray: myFriends)
print(isOneOfMyFriends)             // prints "true"
let isOneOfMyFriends1 = exists(item: "Jerry", inArray: myFriends)
print(isOneOfMyFriends1)            // prints "false"
print("----------------------------------------------------------")
let myNumbers:[Int] = [1,2,3,4,5,6]
let isOneOfMyNumbers = exists(item: 3, inArray: myNumbers)
print(isOneOfMyNumbers)             // prints "true"
let isOneOfMyNumbers1 = exists(item: 10, inArray: myNumbers)
print(isOneOfMyNumbers1)            // prints "false"
print("----------------------------------------------------------")
let myFloatNumbers:[Float] = [1.0, 3.0, 5.0, 10.0]
let isOneOfMyFloatNumbers = exists(item: 1.0, inArray: myFloatNumbers)
print(isOneOfMyFloatNumbers)        // prints "true"
let isOneOfMyFloatNumbers1 = exists(item: 2.0, inArray: myFloatNumbers)
print(isOneOfMyFloatNumbers1)       // prints "false"
print("----------------------------------------------------------")


/* Cusom types and generics */
class BasicPerson {
    var name: String
    var weight: Int
    var sex: String
    
    init(name: String, weight: Int, sex: String) {
        self.name = name
        self.weight = weight
        self.sex = sex
    }
}

let Jim = BasicPerson(name: "Jim Beam", weight: 180, sex: "M")
let JeMin = BasicPerson(name: "JeMin Son", weight: 190, sex: "M")
let Yeji = BasicPerson(name: "Yeji kim", weight: 130, sex: "F")

let basicPersonArray: [BasicPerson] = [Jim, JeMin, Yeji]
//let isJimBasicPerson = exists(item: Jim, inArray: basicPersonArray)
// error: In argument type '[BasicPerson]', 'BasicPerson' does not conform to expected type 'Equatable'
// This happens because, "BasicPerson" class doesn't confrom to the Equatable protocol
// Therefore, we need to
//      - Mark the classs as adopting the Equatable protocol
//      - Overload the == operator for class instances

// Change BasicPerson -> Person using Equatable protocol

class Person: Equatable {
    var name: String
    var weight: Int
    var sex: String
    
    init(name: String, weight: Int, sex: String) {
        self.name = name
        self.weight = weight
        self.sex = sex
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        if (lhs.name == rhs.name && lhs.weight == rhs.weight && lhs.sex == rhs.sex) {
            return true
        } else {
            return false
        }
    }
}

