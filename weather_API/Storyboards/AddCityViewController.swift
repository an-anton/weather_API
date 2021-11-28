//
//  AddCityViewController.swift
//  weather_API
//
//  Created by Anton Anan'eV on 28.11.2021.
//

import UIKit

class AddCityViewController: UIViewController {

    @IBOutlet var addCityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCityTextField.becomeFirstResponder()
    }


}
extension AddCityViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
