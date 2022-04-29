//
//  Location.swift
//  TicketsValidation
//
//  Created by Renato on 4/25/22.
//

import Foundation
import UIKit

class Location: NSObject {
    
    var address: String? = ""
    var district: String? = ""
    var location: String? = ""
    var uf: String? = ""
    
    init(_ dicionario: Dictionary<String, String>) {
        address = dicionario["logradouro"] ?? ""
        district = dicionario["bairro"] ?? ""
        location = dicionario["localidade"] ?? ""
        uf = dicionario["uf"] ?? ""
    }
}
