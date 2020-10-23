//
//  FDCartProtocols.swift
//  FoodDevlivery
//
//  Created ACE_xW on 19/10/2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by ACE_xW
//

import Foundation
import RxSwift
import RxCocoa

//MARK: Wireframe -
protocol FDCartWireframeProtocol: class {

}
//MARK: Presenter -
protocol FDCartPresenterProtocol: class {
    var menus: BehaviorRelay<[FDMenuResponseEntity.Menu]> { get }
    var cartItem: BehaviorRelay<[FDCartItemEntityProtocol]>{ get }
    
    func loadCartItems()
}

//MARK: Interactor -
protocol FDCartInteractorProtocol: class {
    var presenter: FDCartPresenterProtocol?  { get set }
    func fetchCartItems()
}

//MARK: View -
protocol FDCartViewProtocol: class {

  var presenter: FDCartPresenterProtocol?  { get set }
}
