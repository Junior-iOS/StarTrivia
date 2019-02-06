//
//  Film.swift
//  StarTrivia
//
//  Created by Junior Silva on 05/02/19.
//  Copyright © 2019 Junior Silva. All rights reserved.
//

import Foundation

struct Film: Codable {
    
    let title: String
    let episode: Int
    let opening: String
    let director: String
    let producer: String
    let release: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case opening = "opening_crawl"
        case director
        case producer
        case release = "release_date"
    }
    
}
