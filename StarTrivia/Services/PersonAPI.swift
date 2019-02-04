//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    typealias JSON_FORMAT = [String:Any]
    
    // WEB REQUEST WITH ALAMOFIRE AND CODABLE
    func fetchRandomPerson(id: Int, completion: @escaping (Person?) -> ()) {
        
        guard let url = URL(string: "\(PERSON_URL)/\(id)/") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil) }
            do {
                let person = try JSONDecoder().decode(Person.self, from: data)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // WEB REQUEST WITH ALAMOFIRE AND SWIFTYJSON
    func getRandomPersonAlamofireAndSwiftyJSON(id: Int, completion: @escaping (Person?) -> ()) {
        
        guard let url = URL(string: "\(PERSON_URL)/\(id)/") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else { return completion(nil) }
            do {
                let json = try JSON(data: data)
                let person = self.parsePersonWithSwiftyJson(json: json)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // WEB REQUEST WITH ALAMOFIRE
    func getRandomPersonAlamofire(id: Int, completion: @escaping (Person?) -> ()) {

        guard let url = URL(string: "\(PERSON_URL)/\(id)/") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let json = response.result.value as? JSON_FORMAT else { return completion(nil) }
            let person = self.parsePersonManually(json: json)
            completion(person)
        }
    }
    
    // WEB REQUEST WITH URL SESSION
    func getRandomPersonUrlSession(id: Int, completion: @escaping (Person?) -> ()) {

        guard let url = URL(string: "\(PERSON_URL)/\(id)/") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                return
            }
            guard let data = data else { return }

            do {
                let JSON = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = JSON as? JSON_FORMAT else { return }
                let person = self.parsePersonManually(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // PARSINT WITH SWIFTYJSON
    private func parsePersonWithSwiftyJson(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworld"].stringValue
        let filmUlrs = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUlrs = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUlrs = json["starships"].arrayValue.map({$0.stringValue})
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeworldUrl, filmUlrs: filmUlrs, vehicleUlrs: vehicleUlrs, starshipUlrs: starshipUlrs)
    }
    
    // PARSING WITH MANUAL METHODS
    private func parsePersonManually(json: JSON_FORMAT) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUlrs = json["films"] as? [String] ?? [String]()
        let vehicleUlrs = json["vehicles"] as? [String] ?? [String]()
        let starshipUlrs = json["starships"] as? [String] ?? [String]()
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeWorldUrl: homeworldUrl, filmUlrs: filmUlrs, vehicleUlrs: vehicleUlrs, starshipUlrs: starshipUlrs)
    }
    
}
