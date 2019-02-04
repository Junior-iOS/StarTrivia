//
//  Person.swift
//  StarTrivia
//
//  Created by Junior Silva on 03/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation

struct Person: Codable {
    
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeWorldUrl: String
    let filmUlrs: [String]
    let vehicleUlrs: [String]
    let starshipUlrs: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeWorldUrl = "homeworld"
        case filmUlrs = "films"
        case vehicleUlrs = "vehicles"
        case starshipUlrs = "starships"
    }
    
}
