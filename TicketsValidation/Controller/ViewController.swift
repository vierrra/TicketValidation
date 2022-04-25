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
    
    // MARK: - Actions
   
    @IBAction func changedValueCepTextField(_ sender: UITextField) {
        requestCep()
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

