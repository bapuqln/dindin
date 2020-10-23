//
//  FDMenuCellModel.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 21/10/2020.
//

import Foundation

struct FDHomeMenuEntity: FDHomeMenuEntityProtocol {
    
    var identifier: String?
    
    var name: String? { return menuEntity.name }
    
    var description: String? { return menuEntity.description }
    
    var imageUrl: String? { return menuEntity.imageUrl }
    
    var deliveryDescription: String? { return menuEntity.description }
    
    var prices: Int? { return menuEntity.price }
    
    var menuEntity: FDMenuResponseEntity.Menu
    
    init(_ menu: FDMenuResponseEntity.Menu) {
        self.menuEntity = menu
    }
}
