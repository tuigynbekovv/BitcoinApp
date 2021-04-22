//
//  AppConstant.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import Foundation


enum Font {
    static let mullerMedium  = "MullerMedium"
    static let mullerRegular = "MullerRegular"
    static let mullerBold    = "MullerBold"
    static let mullerBlack   = "MullerBlack"
}


enum Type {
    case dollor
    case tenge
    case euro
}


enum Api {
    static let ticker       = "www.bitstamp.net/api/ticker"
    static let transactions = "www.bitstamp.net/api/transactions/"
}


enum Currency {
    static let types = ["USA", "TENGE", "EURO"]
}

enum DefaultTitle {
    static let notEnough = "суммы не хватает =("
    static let price     = "Сейчас, цена за 1 биткоин: "
}
