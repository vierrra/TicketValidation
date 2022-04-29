//
//  ViewController.swift
//  TicketsValidation
//
//  Created by Renato Vieira on 6/24/21.
//

import UIKit
 
class ViewController: UIViewController {

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureBannerImageView()
    }
    
    func fetchTextField(textFieldType: TextFieldType, completion:(_ requestTextField: UITextField) -> Void) {
        for textField in textFields {
            if let textFieldCurrent = TextFieldType(rawValue: textField.tag) {
                if textFieldCurrent == textFieldType {
                    completion(textField)
                }
            }
        }
    }
    
    // MARK: - Actions
   
    @IBAction func changedValueCepTextField(_ sender: UITextField) {
        let queryCep = LocationAPI()
        guard let cep = sender.text else { return }
        
        queryCep.requestCep(cep: cep) { locationData in
            self.fetchTextField(textFieldType: .address) { requestTextField in
                requestTextField.text = locationData.address
            }
            self.fetchTextField(textFieldType: .district) { requestTextField in
                requestTextField.text = locationData.district
            }
        } failure: { err in
            print(err)
        }
    }
    
    @IBAction func buyButton(_ sender: Any) {
        checkTextFieldsFilledAndValidated()
    }
    
    func checkTextFieldsFilledAndValidated() {
        let textFieldsFilled = ValidateFormViewController().checkIfTextFieldsIsEmpty(textFields)
        let textFieldsValidated = ValidateFormViewController().validateTextFields(textFields)
       
        if textFieldsFilled && textFieldsValidated {
            let alert = ValidateFormViewController().showTextFieldsAlertFilled("Parabéns", "Compra realizada com sucesso")
            
            present(alert, animated: true, completion: nil)
        } else {
            let alert = ValidateFormViewController().showTextFieldsAlertFilled("Aviso", "Preeencha os campos")
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    func configureBannerImageView() {
        self.bannerImageView.layer.cornerRadius  = 10
        self.bannerImageView.layer.masksToBounds = true
    }
}

