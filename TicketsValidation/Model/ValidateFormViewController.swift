//
//  ValidateFormViewController.swift
//  TicketsValidation
//
//  Created by Renato Vieira on 7/6/21.
//

import UIKit
import CPF_CNPJ_Validator
import CreditCardValidator

enum TextFieldType: Int {
    case name = 1
    case email = 2
    case cpf = 3
    case cep = 4
    case address = 5
    case district = 6
    case cardNumber = 7
    case cardExpiryMonth = 8
    case cardExpiryYear = 9
    case cardSecurityCode = 10
}

class ValidateFormViewController: UIViewController {

    func checkIfTextFieldsIsEmpty(_ textFields: [UITextField]) -> Bool {
        
        for texField in textFields {
            if texField.text == ""{
                return false
            }
        }
        return true
    }
    
    func validateTextFields(_ textFields: [UITextField]) -> Bool {
        let cpfValidate = BooleanValidator()
        var dictionaryTextField: Dictionary<TextFieldType, UITextField> = [:]
        
        for textField in textFields {
            if let textFieldType = TextFieldType(rawValue: textField.tag) {
                dictionaryTextField[textFieldType] = textField
            }
        }
        
        guard let cpf = dictionaryTextField[.cpf], cpfValidate.validate(cpf: cpf.text!) else { return false }
        guard let email = dictionaryTextField[.email], self.checkEmail(email.text!) else { return false }
        guard let cardNumber = dictionaryTextField[.cardNumber], CreditCardValidator(<#String#>).isValid(for: CreditCardType(rawValue: cardNumber.text!) ?? <#default value#>) else { return false }
        
        return true
    }
    
    func checkEmail(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)

        return emailTest.evaluate(with: email)
    }
    
    func showTextFieldsAlertFilled(_ title: String, _ message: String) -> UIAlertController {
        let alert    = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(buttonOk)
        
        return alert
    }
}
