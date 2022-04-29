//
//  LocationAPI.swift
//  TicketsValidation
//
//  Created by Renato on 4/25/22.
//

import UIKit
import Alamofire

class LocationAPI: NSObject {
    
    func requestCep(cep: String, success: @escaping(_ locationData: Location) -> Void, failure: @escaping(_ err: Error) -> Void) {
        let request = AF.request("https://viacep.com.br/ws/\(cep)/json/").validate()
        
        request.responseJSON { (response) in
            switch response.result {
                case .success:
                    if let result = response.value as? Dictionary<String, String> {
                        let location = Location(result)
                        
                        success(location)
                    }
                    break
                case .failure:
                failure(response.error!)
                    break
            }
        }
    }

}
