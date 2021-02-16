//
//  PresentBozoAlert.swift
//  PizzaCalcTrash
//
//  Created by stanley phillips on 2/9/21.
//

import UIKit

extension UIViewController {
    func presentBozoAlert() {
        let alertController = UIAlertController(title: "Whooaaa!", message: "You can't order pizza for noone ya bozo!", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
