import UIKit

/* Generic code enables you to write flexibe, reusable functions and types that can work with any type
 
 Swift's Array and Dictionary types are both generic collections
 */

/* Non-Generic function */
// 1. swaps two Int values
// swapTwoInts(_:_:) function swaps original value of b into a, and original value of a into b
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var variableA = 3
var variableB = 197
print("variableA is \(variableA), and variableB is \(variableB)")
swapTwoInts(&variableA, &variableB)
print("-- After swapping --")
print("variableA is now \(variableA), and variableB is now \(variableB)")
print("---------------------------------------------------")
// swapTwoInts(_:_:) function is useful, but can only work with Int values
// If you want to swap two String values, or Double values, you have to write more functions

// 2. swaps two String values
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let tempA = a
    a = b
    b = tempA
}

var stringVariableA = "Original"
var stringVariableB = "New"
print("stringVariableA is \(stringVariableA), and stringVariableB is \(stringVariableB)")
swapTwoStrings(&stringVariableA, &stringVariableB)
print("-- After swapping --")
print("stringVariableA is now \(stringVariableA), and stringVariableB is now \(stringVariableB)")
print("---------------------------------------------------")


// These are identical and not a good way to code. It will be more useful, and more flexible to write single function that swaps two values of any type
// Generic code enables you to write such a function

/* Generic Functions */
// Generic functions can work with any type
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {         // uses placeholder type name (called T)
    let tempA = a
    a = b
    b = tempA
}

var intVariableA = 10
var intVariableB = 100
print("intVariableA is \(intVariableA), and intVariableB is \(intVariableB)")
swapTwoValues(&intVariableA, &intVariableB)
print("-- After swapping --")
print("intVariableA is now \(intVariableA), and intVariableB is now \(intVariableB)")
print("---------------------------------------------------")

var anotherStringVariableA = "Another Original"
var anotherStringVariableB = "Another New"
print("anotherStringVariableA is \(anotherStringVariableA), and anotherStringVariableB is \(anotherStringVariableB)")
swapTwoValues(&anotherStringVariableA, &anotherStringVariableB)
print("-- After swapping --")
print("anotherStringVariableA is now \(anotherStringVariableA), and anotherStringVariableB is now \(anotherStringVariableB)")
print("---------------------------------------------------")


// Type Parameters
//      type parameter specify and name placeholder type (such as <T>), and are written immediately after the function's name
//
//      can be used:
//          - type of function's parameters
//          - function's return type
//          - type annotation within the body of the function
//
//      In each case, type parameter is replaced with an actual type whenever the function is called
//
// Naming Type Parameters
//      Always give type parameters upper camel case :: such as T, U, and V


// Generic Types
//      Stack :: - generic collection type
//               - ordered set of values, similar to an array but with more restricted sset of operations than array
//               - new items can be appended only to the end of the collection(push), and only be removed from the end of the collection(pop)
//
//      Concept of Stack is used by UINavigationController class
//          - pushViewController(_:animated:) method to add(or push) ViewController on to the navigation stack
//          - popViewControllerAnimated(_:) method to remove(or pop) ViewController from the navigation stack

/* Non-Generic version of Stack */
struct IntStack {
    var items = [Int]()                     // Array property called items is initialized
    mutating func push(_ item: Int) {       // mutating :: because they need to modify the structure's items array
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
// This IntStack can be only be used with Int values
// Let's try generic stack class which can manage stack of any type of value

/* Generic version of Stack */
struct Stack<Element> {                         // Element :: placeholder
    var items = [Element]()                     // Initialize empty array of values of type Element
    mutating func push(_ item: Element) {       // mutating :: because they need to modify the structure's items array
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("Uno")
stackOfStrings.push("Dos")
stackOfStrings.push("Tres")
stackOfStrings.push("Cuatro")
print(stackOfStrings)                           // prints "Stack<String>(items: ["Uno", "Dos", "Tres", "Cuatro"])"
stackOfStrings.pop()                // pop the top value on the stack
print(stackOfStrings)                           // prints "Stack<String>(items: ["Uno", "Dos", "Tres"])"

/* Extending Generic Type */
// When you extend generic type, you don't provide type parameter list as part of the extenstion definition

extension Stack {                   // Read-only computed property which returns the top item on the stack without popping it from the stack
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
// topItem computed property
if let topItem = stackOfStrings.topItem {
    print("the top item on the stack is \(topItem)")            // prints "the top item on the stack is Tres"
}
