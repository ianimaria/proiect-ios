//
//  Item.swift
//  Iani_Maria_333
//
//  Created by user216460 on 5/8/22.
//

import Foundation

struct Comparison: Codable {
    let Hotel: String
    let best_price: String
    
    enum CodingKeys: String, CodingKey {
        case Hotel = "hotelName"
        case best_price = "hotelId"
    }
}
