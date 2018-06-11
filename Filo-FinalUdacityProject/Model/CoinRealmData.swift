//
//  CoinRealmData.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 6/10/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Coin: Object, Decodable {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var symbol: String = ""
    @objc dynamic var rank: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var marketCap: String = ""
    @objc dynamic var dayVolume: String = ""
    @objc dynamic var totalSupply: String = ""
    
    private enum CoinCodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        case price = "price_usd"
        case marketCap = "market_cap_usd"
        case dayVolume = "24h_volume_usd"
        case totalSupply = "total_supply"
    }
    
    convenience init(id: String, name: String, symbol: String, rank: String, price: String, marketCap: String, dayVolume: String, totalSupply: String) {
        self.init()
        self.id = id
        self.name = name
        self.symbol = symbol
        self.rank = rank
        self.price = price
        self.marketCap = marketCap
        self.dayVolume = dayVolume
        self.totalSupply = totalSupply
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CoinCodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let symbol = try container.decode(String.self, forKey: .symbol)
        let rank = try container.decode(String.self, forKey: .rank)
        let price = try container.decode(String.self, forKey: .price)
        let marketCap = try container.decode(String.self, forKey: .symbol)
        let dayVolume = try container.decode(String.self, forKey: .rank)
        let totalSupply = try container.decode(String.self, forKey: .price)
        
        self.init(id: id, name: name, symbol: symbol, rank: rank, price: price, marketCap: marketCap, dayVolume: dayVolume, totalSupply: totalSupply)
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}


