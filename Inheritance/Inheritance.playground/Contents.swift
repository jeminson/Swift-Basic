import UIKit

/**********************************************************************************************************/
/* base class or super class or parent class */
class baseClass {
    
}

/* derived class or sub class or child class */
class subClass: baseClass {                         // inheritting from baseClass
    // Will have access to baseClass properties
}

/**********************************************************************************************************/
 
/* Example */
class Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func celebrateBirthday() {
        self.age += 1
        print("Happy Birthday \(self.name)")
    }
}

class Youtuber: Person {        // Youtuber class is inheritting from Person class
    let channelName: String
    var subscribers: Int
    
    // need to pass in the name & age of the Youtuber Person
    init(channelName: String, subscribers: Int, name: String, age: Int) {
        self.channelName = channelName
        self.subscribers = subscribers
        
        // use this to initialise the Person from within the subclass
        super.init(name: name, age: age)
    }
}

let jemin : Youtuber = Youtuber(channelName: "Swift", subscribers: 100, name: "Je Min", age: 28)
jemin.celebrateBirthday()
print(jemin.age)

/**********************************************************************************************************/

