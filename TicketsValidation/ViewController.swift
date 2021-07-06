//
//  ViewController.swift
//  TicketsValidation
//
//  Created by Renato on 6/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureBannerImageView()
       
    }

    func configureBannerImageView() {
        self.bannerImageView.layer.cornerRadius  = 10
        self.bannerImageView.layer.masksToBounds = true
    }
}

