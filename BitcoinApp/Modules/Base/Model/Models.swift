//
//  Models.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 20.04.2021.
//

import Foundation


struct TransactionsModel: Codable {
    let date:   String
    let tid:    Int
    let amount: String
    let type:   Int
    let price:  String
}


struct LiveModel: Codable {
    let timestamp: String
    let high:      String
    let low:       String
    let open:      Double
    let last:      String
}
