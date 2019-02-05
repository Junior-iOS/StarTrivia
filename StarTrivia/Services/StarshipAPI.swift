//
//  StarshipAPI.swift
//  StarTrivia
//
//  Created by Junior Silva on 04/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation
import Alamofire

class StarshipAPI {
    
    func fetchStarship(url: String, completion: @escaping (Starship?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error  {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            do {
                let starship = try JSONDecoder().decode(Starship.self, from: data)
                completion(starship)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
