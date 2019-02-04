//
//  HomeworldAPI.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation
import Alamofire

class HomeworldAPI {
    
    func fetchHomeworld(homeworldUrl: URL?, completion: @escaping (Homeworld?) -> ()) {
        
        guard let url = homeworldUrl else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            do {
                let homeworld = try JSONDecoder().decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
