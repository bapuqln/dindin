//
//  FDEntityManager.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 24/10/2020.
//

import Foundation

public class FDEntityManager {
    private static let sharedInstance: FDEntityManager = {
        return FDEntityManager()
    }()

    private init() { }

    public class func shared() -> FDEntityManager {
       return sharedInstance
    }
    
    
}
