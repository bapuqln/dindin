//
//  FDCellConfigProtocol.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 23/10/2020.
//

import Foundation

protocol FDCellConfigProtocol {
    associatedtype CellEntity
    
    func configCell(with entity: CellEntity)
}
