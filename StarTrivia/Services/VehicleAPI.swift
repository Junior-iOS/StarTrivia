//
//  VehicleAPI.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation
import Alamofire

class VehicleAPI {
    
    func fetchVehicle(url: String, completion: @escaping (Vehicle?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            do {
                let vehicle = try JSONDecoder().decode(Vehicle.self, from: data)
                completion(vehicle)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
