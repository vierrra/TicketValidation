//
//  ViewController.swift
//  TicketsValidation
//
//  Created by Renato Vieira on 6/24/21.
//

import UIKit
import CPF_CNPJ_Validator

class ViewController: UIViewController {

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureBannerImageView()
        
        let cpf = "03004499410"
        
        if BooleanValidator().validate(cpf: cpf) {
            print("cpf válido")
        } else {
            print("cpf inválido")
        }
    }

    @IBAction func buyButton(_ sender: Any) {
        let textFieldsFilled = ValidateFormViewController().checkIfTextFieldsIsEmpty(textFields)
       
        if textFieldsFilled {
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

