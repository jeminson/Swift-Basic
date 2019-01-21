import UIKit



/* Static vs Class Example 1 */
class Person {
    static var count: Int {
        return 300
    }
    class var averageAge: Double {
        return 20.5
    }
}

// create Student class by inheriting from Person, trying to override count (static property) would fail to compile, whereas trying to override averageAge (class property) will be ok
class Student: Person {
    // This is not allowed
    override static var count: Int {             // Static cannot be override
        return 250
    }
    // This is allowed
    override class var averageAge: Double {      // Class can be override
        return 19.5
    }
}

/* Static vs Classs Example 2*/
class TestA {
    class func t1() {
        print("Hello t1")
    }
    static func t2() {
        print("Hello t2")
    }
}

class TestB: TestA {   // TestB class inheriting from TestA
    // This is allowed
    override class func t1() {              // Class can be override
        print("Hello t1")
    }
    // This is not allowed
    override static func t2() {             // Static cannot be override
        print("Hello t2")
    }
}


/* Struct cannot have class function */
struct TestC {
    static func t1() {
        print("static test")
    }
    class func t2() {                       // Struct cannot have Class function 
        print("class test")
    }
}
