//
//  CalculatorController.swift
//  PizzaCalcTrash
//
//  Created by stanley phillips on 2/9/21.
//

import Foundation

class CalculatorController {
    // MARK: - Properties
    static let shared = CalculatorController()
    var restaurants: [String] = ["Domino's", "Pizza Hut", "Papa John's", "Little Caesars", "Ya Mom'z", "Sbarro", "Mario's", "Luigi's"]

    // MARK: - Methods
    func calculatePieAmount(hunger: Int, people: Double) -> Int {
        var pies: Int = 1
        switch hunger {
        case 0:
            let pieAmount = (people * 1.0) / 8.0
            pies = Int(ceil(pieAmount))
        case 1:
            let pieAmount = (people * 2.0) / 8.0
            pies = Int(ceil(pieAmount))
        case 2:
            let pieAmount = (people * 4.0) / 8.0
            pies = Int(ceil(pieAmount))
        default:
            pies = 1
        }
        return pies
    }//end func
}//end class
