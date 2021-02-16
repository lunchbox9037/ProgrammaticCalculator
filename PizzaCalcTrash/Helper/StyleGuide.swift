//
//  StyleGuide.swift
//  PizzaCalcTrash
//
//  Created by stanley phillips on 2/9/21.
//

import UIKit

extension UIColor {
    static let cheeseYellow = UIColor(named: "cheeseYellow")!
    static let sauceRed = UIColor(named: "sauceRed")!
    static let darkSauce = UIColor(named: "darkSauce")!
    static let orangeAccent = UIColor(named: "orangeAccent")!
    static let subtleCheeseYellow = UIColor(named: "subtleCheeseYellow")
}//end extension

extension UIView {
    func addCornerRadius(radius: CGFloat = 6) {
        self.layer.cornerRadius = radius
    }
}//end extension

struct FontNames {
    static let pizzaTitleFont = "GOOD PEOPLE"
    static let pizzaMainFont = "Letters for Learners"
}
