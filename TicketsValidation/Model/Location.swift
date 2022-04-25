//
//  Location.swift
//  TicketsValidation
//
//  Created by Renato on 4/25/22.
//

import Foundation
import UIKit

class Location: NSObject {
    
    var logradouro: String? = ""
    var bairro: String? = ""
    var localidade: String? = ""
    var uf: String? = ""
    
    init(_ dicionario: Dictionary<String, String>) {
        logradouro = dicionario["logradouro"] ?? ""
        bairro = dicionario["bairro"] ?? ""
        localidade = dicionario["localidade"] ?? ""
        uf = dicionario["uf"] ?? "
    }
}
