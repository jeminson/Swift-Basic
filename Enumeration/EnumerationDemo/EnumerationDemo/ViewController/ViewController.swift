//
//  ViewController.swift
//  EnumerationDemo
//
//  Created by Je Min Son on 1/20/19.
//  Copyright © 2019 Jason Son. All rights reserved.
//

import UIKit

// enum with type
enum Gender: String {
    // use 'case' keyword to introduce new enumeration cases
    case Male
    case Female
}

// enum without type :: No rawValues available, you get memeber called hashValue
enum Refrigerator {
    case Fridger            // hashValue of 0
    case Freezer            // hashValue of 1
}

// enum with raw values, enum case cannot have raw value if the enum does not have raw type
enum Sports: String {
    case Basketball = "This is basketball"
    case Baseball
}

// enum with defined values if enum is having raw type
// If integers are used for raw values, they auto-increment from previous value if not value is specified
enum Genres: Int {
    case One = 1001, Two, Three, Four, Five, Six = 2001, Seven, Eight
}

// enum with method
enum WeekDay: String {
    case Monday = "Today is Monday"
    case Tuesday
    
    func day() -> String {
        return self.rawValue
    }
}

// enum with associated values
enum Student {
    case Name(String)
    case Makr(Int, Int, Int)
}

class ViewController: UIViewController {

    var gender: Gender = Gender.Male
    var weekday: WeekDay = WeekDay.Monday
    var studentDetails = Student.Name("Student")
    var studentMarks = Student.Makr(88, 91, 79)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderInfo()
        refrigeratorInfo()
        sportsInfo()
        genresInfo()
        
        print(weekday.day())        // prints "Today is Monday"
        
        studentInfo()
        
    }

    func genderInfo() {
        // Don't need default case because all the possible enum members are taken care
        switch gender {
        case .Male:
            print("Gender is male")
        case .Female:
            print("Gender if female")
        }
    }
    
    func refrigeratorInfo() {
        print(Refrigerator.Fridger)         // prints "Fridger"
     // print(Refrigerator.Fridger.rawValue) // error: enum case cannot have raw value if the enum does not have raw type
    }
    
    func sportsInfo() {
        print(Sports.Basketball)            // prints "Basketball"
        print(Sports.Basketball.rawValue)   // prints "This is basketball"
        print(Sports.Baseball)              // prints "Baseball"
        print(Sports.Baseball.rawValue)     // prints "Baseball"
    }
    
    func genresInfo() {
        print("Genres Result: \(Genres.Two.rawValue)")  // prints "Genres Result: 1002"
        print("Genres Result: \(Genres.Three.rawValue)")  // prints "Genres Result: 1003"
        print("Genres Result: \(Genres.Six.rawValue)")  // prints "Genres Result: 2001"
        print("Genres Result: \(Genres.Seven.rawValue)")  // prints "Genres Result: 2002"
    }
    
    func studentInfo() {
        switch studentMarks {
        case .Name(let studentName):
            print("Student name is: \(studentName)")
        case .Makr(let Mark1, let Mark2, let Mark3):
            print("Student marks are: \(Mark1), \(Mark2), \(Mark3)")
        }
    }
}

