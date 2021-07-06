//
//  ValidateFormViewController.swift
//  TicketsValidation
//
//  Created by Renato Vieira on 7/6/21.
//

import UIKit

class ValidateFormViewController: UIViewController {

    func checkIfTextFieldsIsEmpty(_ textFields: [UITextField]) -> Bool {
        
        for texField in textFields {
            if texField.text == ""{
                return false
            }
        }
        return true
    }
    
    func showTextFieldsAlertFilled(_ title: String, _ message: String) -> UIAlertController {
        let alert    = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(buttonOk)
        
        return alert
    }
}
