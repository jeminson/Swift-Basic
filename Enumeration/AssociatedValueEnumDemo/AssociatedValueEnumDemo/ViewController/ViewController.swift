//
//  ViewController.swift
//  AssociatedValueEnumDemo
//
//  Created by Je Min Son on 1/20/19.
//  Copyright © 2019 Jason Son. All rights reserved.
//

import UIKit

// Associated Value
enum Airport {
    case munich
    case sanFrancisco
    case singapore
    case london(airportName: LondonAirportName)
}

// Create another enum for London airport
enum LondonAirportName {
    case stansted
    case heathrow
    case getwick
}

class ViewController: UIViewController {

    var airport: Airport = Airport.sanFrancisco
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        airportInfo()
    }

    func airportInfo() {
        print(airport)          // prints "sanFrancisco"
        
        airport = .munich
        print(airport)          // prints "munich"
        
        airport = .london(airportName: .stansted)
        print(airport)          // prints "london(airportName:
                                //             AssociatedValueEnumDemo.LondonAirportName.stansted)"
    }
    
}

