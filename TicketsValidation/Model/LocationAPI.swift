//
//  LocationAPI.swift
//  TicketsValidation
//
//  Created by Renato on 4/25/22.
//

import UIKit
import Alamofire

class LocationAPI: NSObject {
    
    func requestCep(cep: String, success: @escaping(_ location: Location) -> Void, failure: @escaping(_ error: Error) -> Void) {
        let request = AF.request("https://viacep.com.br/ws/01001000/json/").validate()
        
        request.responseJSON { (response) in
            switch response.result {
                case .success:
                    if let result = response.value as? Dictionary<String, String> {
                        let location = Location(result)
                    }
                    break
                case .failure:
                
                    break
            }
        }
    }

}
