//
//  Starship.swift
//  StarTrivia
//
//  Created by Junior Silva on 04/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation

struct Starship: Codable {
    
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let maxSpeed: String
    let crew: String
    let passengers: String
    let cargo: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case maxSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargo = "cargo_capacity"
    }
    
}
