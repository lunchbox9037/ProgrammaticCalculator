//
//  PizzaCalculatorViewController.swift
//  PizzaCalcTrash
//
//  Created by stanley phillips on 2/9/21.
//

import UIKit

class PizzaCalculatorViewController: UIViewController {
    // MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    var pizzas: Int?
    var selectedRestaurant: String = CalculatorController.shared.restaurants[0]
    
    var button: UIButton {return calculateButton}
    var textField: UITextField {return peopleTextField}
    var segment: UISegmentedControl {return hungerSegment}
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        addAllSubviews()
        constrainEverything()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cheeseYellow
        activateCalculateButton()
        restuarantPicker.dataSource = self
        restuarantPicker.delegate = self
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
               view.addGestureRecognizer(tap)
    }
    
    // MARK: - Methods
    @objc func calculateButtonTapped(sender: UIButton) {
        guard let people = textField.text else {return }
        guard let peopleNum = Double(people) else {return presentBozoAlert()}
        pizzas = CalculatorController.shared.calculatePieAmount(hunger: segment.selectedSegmentIndex, people: peopleNum)
        guard let pies = pizzas else {return}
        if pies > 1 {
            resultsLabel.text = "Order \(pies) pies from \(selectedRestaurant) ya bozo!!"
        } else {
            resultsLabel.text = "Order \(pies) pie from \(selectedRestaurant) ya bozo!!"
        }
        peopleTextField.text = nil
        peopleTextField.resignFirstResponder()
    }
    
    func activateCalculateButton() {
        self.button.addTarget(self, action: #selector(calculateButtonTapped(sender:)), for: .touchUpInside)
    }

    func addAllSubviews() {
        self.view.addSubview(mainLabel)
        self.view.addSubview(peopleLabel)
        self.view.addSubview(peopleTextField)
        self.view.addSubview(hungerLabel)
        self.view.addSubview(hungerSegment)
        self.view.addSubview(restaurantLabel)
        self.view.addSubview(restuarantPicker)
        self.view.addSubview(resultsLabel)
        self.view.addSubview(calculateButton)
    }
    
    func constrainEverything() {
        constrainMainLabel()
        constrainPeopleLabel()
        constrainPeopleTextField()
        constrainHungerLabel()
        constrainHungerSegment()
        constrainRestaurantLabel()
        constrainRestaurantPicker()
        constrainResultsLabel()
        constrainCalculateButton()
    }
    
    // MARK: - Views
    //create all items on screen
    let mainLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cheeseYellow
        label.textColor = .sauceRed
        label.layer.borderColor = UIColor.darkSauce.cgColor
        label.font = UIFont(name: FontNames.pizzaTitleFont, size: 44)
        label.textAlignment = .center
        label.minimumScaleFactor = CGFloat(0.5)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "🍕Wize GuyZ🍕\n Pizza Calculator"
        
        return label
    }()
    
    let peopleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cheeseYellow
        label.textColor = .sauceRed
        label.layer.borderColor = UIColor.darkSauce.cgColor
        label.font = UIFont(name: FontNames.pizzaMainFont, size: 34)
        label.minimumScaleFactor = CGFloat(0.5)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
    
        label.text = "How many people eatin!?"
        
        return label
    }()
    
    let peopleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "uuh how many..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .cheeseYellow
        textField.textColor = .sauceRed
        textField.layer.borderWidth = 2.5
        textField.layer.borderColor = UIColor.darkSauce.cgColor
        textField.clearButtonMode = .whileEditing
        textField.addCornerRadius()
    
        return textField
    }()
    
    let hungerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cheeseYellow
        label.textColor = .sauceRed
        label.layer.borderColor = UIColor.darkSauce.cgColor
        label.font = UIFont(name: FontNames.pizzaMainFont, size: 34)
        label.minimumScaleFactor = CGFloat(0.5)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
    
        label.text = "How hungry aaahh yaaahh!?"
        
        return label
    }()
    
    let hungerSegment: UISegmentedControl = {
        var segment = UISegmentedControl()
        let hungerLevelArrays = ["Ehhh", "Hungry", "Staahvin"]
        segment = UISegmentedControl(items: hungerLevelArrays)
        segment.backgroundColor = .cheeseYellow
        segment.selectedSegmentTintColor = .sauceRed
        segment.selectedSegmentIndex = 1
        segment.layer.borderWidth = 2.5
        segment.layer.borderColor = UIColor.darkSauce.cgColor
        segment.setTitleTextAttributes([.foregroundColor : UIColor.cheeseYellow], for: .selected)
        segment.translatesAutoresizingMaskIntoConstraints = false
        let titleFont : UIFont = UIFont(name: FontNames.pizzaMainFont, size: 24)!
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.darkSauce,
            NSAttributedString.Key.font : titleFont
        ]
        segment.setTitleTextAttributes(attributes, for: .normal)
        segment.addCornerRadius()
        return segment
    }()
    
    let restaurantLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cheeseYellow
        label.textColor = .sauceRed
        label.layer.borderColor = UIColor.darkSauce.cgColor
        label.font = UIFont(name: FontNames.pizzaMainFont, size: 34)
        label.minimumScaleFactor = CGFloat(0.5)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
    
        label.text = "Where ya orderin from!?"
        
        return label
    }()
    
    let restuarantPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .cheeseYellow
        picker.layer.borderWidth = 2.5
        picker.layer.borderColor = UIColor.darkSauce.cgColor
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addCornerRadius()
        return picker
    }()
    
    let resultsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cheeseYellow
        label.textColor = .sauceRed
        label.layer.borderColor = UIColor.darkSauce.cgColor
        label.font = UIFont(name: FontNames.pizzaTitleFont, size: 34)
        label.minimumScaleFactor = CGFloat(0.5)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
    
        return label
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .sauceRed
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.darkSauce.cgColor
        button.setTitleColor(.cheeseYellow, for: .normal)
        button.setTitle("  How many pies should I orduuhh?  ", for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.pizzaMainFont, size: 24)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addCornerRadius()

        return button
    }()
}//end class

// MARK: - Extensions
extension PizzaCalculatorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CalculatorController.shared.restaurants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CalculatorController.shared.restaurants[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRestaurant = CalculatorController.shared.restaurants[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: CalculatorController.shared.restaurants[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkSauce])
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: FontNames.pizzaMainFont, size: 30)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = CalculatorController.shared.restaurants[row]
        pickerLabel?.textColor = UIColor.darkSauce
        
        return pickerLabel!
    }
}//end extension
