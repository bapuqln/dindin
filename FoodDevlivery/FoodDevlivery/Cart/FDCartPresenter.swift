//
//  FDCartPresenter.swift
//  FoodDevlivery
//
//  Created ACE_xW on 19/10/2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by ACE_xW
//

import UIKit
import RxSwift
import RxCocoa

class FDCartPresenter: FDCartPresenterProtocol {
    
    var cartItem = BehaviorRelay<[FDCartItemEntityProtocol]>(value: [])

    weak private var view: FDCartViewProtocol?
    var interactor: FDCartInteractorProtocol?
    private let router: FDCartWireframeProtocol
    
    private var cartList:[FDMenuResponse.Menu] = []
    
    private let disposeBag = DisposeBag()

    init(interface: FDCartViewProtocol, interactor: FDCartInteractorProtocol?, router: FDCartWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func onViewDidload() {

    }
}
