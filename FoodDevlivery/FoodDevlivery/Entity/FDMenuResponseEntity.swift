//
//  FDMenuEntity.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//

import Foundation
import ObjectMapper

struct FDMenuResponseEntity: Mappable {
    var menu: [Menu]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        menu <- map["menu"]
    }
    
    struct Menu: Mappable {
        var identifier: String?
        var name: String?
        var description: String?
        var imageUrl: String?
        var size: String?
        var weight: String?
        var price: Int?
        
        init?(map: Map) {}
        
        mutating func mapping(map: Map) {
            identifier <- map["identifier"]
            name <- map["name"]
            description <- map["description"]
            imageUrl <- map["imageUrl"]
            size <- map["size"]
            weight <- map["weight"]
            price <- map["price"]
        }
    }
}
