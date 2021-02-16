//
//  ConstraintExt.swift
//  PizzaCalcTrash
//
//  Created by stanley phillips on 2/10/21.
//

import Foundation

extension PizzaCalculatorViewController {
    func constrainMainLabel() {
        mainLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
    }
    
    func constrainPeopleLabel() {
        peopleLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 16).isActive = true
        peopleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32).isActive = true
        peopleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32).isActive = true
    }
    
    func constrainPeopleTextField() {
        peopleTextField.topAnchor.constraint(equalTo: peopleLabel.bottomAnchor, constant: 8).isActive = true
        peopleTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 100).isActive = true
        peopleTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -100).isActive = true
    }
    
    func constrainHungerLabel() {
        hungerLabel.topAnchor.constraint(equalTo: peopleTextField.bottomAnchor, constant: 16).isActive = true
        hungerLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32).isActive = true
        hungerLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32).isActive = true
    }
    
    func constrainHungerSegment() {
        hungerSegment.topAnchor.constraint(equalTo: hungerLabel.bottomAnchor, constant: 8).isActive = true
        hungerSegment.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        hungerSegment.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
    }
    
    func constrainRestaurantLabel() {
        restaurantLabel.topAnchor.constraint(equalTo: hungerSegment.bottomAnchor, constant: 16).isActive = true
        restaurantLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32).isActive = true
        restaurantLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32).isActive = true
    }
    
    func constrainRestaurantPicker() {
        restuarantPicker.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 8).isActive = true
        restuarantPicker.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        restuarantPicker.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
    }
    
    func constrainCalculateButton() {
        calculateButton.topAnchor.constraint(equalTo: restuarantPicker.bottomAnchor, constant: 16).isActive = true
        calculateButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -140).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0).isActive = true
    }
    
    func constrainResultsLabel() {
        resultsLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 32).isActive = true
        resultsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32).isActive = true
        resultsLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32).isActive = true
    }
}//end extension
