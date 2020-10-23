//
//  FDCellConfigProtocol.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 23/10/2020.
//

import Foundation

protocol FDCellUpdateProtocol {
    associatedtype CellEntity
    
    func updateCell(with entity: CellEntity)
}
