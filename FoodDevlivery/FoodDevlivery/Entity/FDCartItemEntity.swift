//
//  FDCartEntity.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 23/10/2020.
//

import Foundation

protocol FDCartItemEntityProtocol {
    var name: String?{get}
    var imgURL: String?{get}
    var price: Int?{get}
}

struct FDCartItemEntity: FDCartItemEntityProtocol{
    var menuItem: FDMenuResponseEntity.Menu
    var name: String? { return menuItem.name }
    var imgURL: String? { return menuItem.imageUrl }
    var price: Int? { return menuItem.price }
    
    init(menu: FDMenuResponseEntity.Menu) {
        self.menuItem = menu
    }
}
