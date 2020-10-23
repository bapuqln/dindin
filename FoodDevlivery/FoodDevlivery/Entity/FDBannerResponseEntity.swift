//
//  FDBannerEntity.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//

import Foundation
import ObjectMapper

struct FDBannerResponseEntity: Mappable {
    
    var banner: [String]?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        banner <- map["banner"]
    }
    
}
