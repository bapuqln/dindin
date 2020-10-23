//
//  FDHomePresenter.swift
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

class FDHomePresenter: FDHomePresenterProtocol {
    weak private var view: FDHomeViewProtocol?
    public var interactor: FDHomeInteractorProtocol?
    private let router: FDHomeWireframeProtocol
    
    var addItem = PublishSubject<FDMenuResponse.Menu>()
    var listItems = BehaviorRelay<[FDMenuResponse.Menu]>(value: [])
    var itemsCount = BehaviorRelay<String>(value: "")
    var menuLists = BehaviorRelay<[FDHomeMenuEntityProtocol]>(value: [])
    
    private let disposeBag = DisposeBag()
    
    private var items: [FDMenuResponse.Menu] = []
    
    init(interface: FDHomeViewProtocol, interactor: FDHomeInteractorProtocol?, router: FDHomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        
        self.addItem.subscribe(onNext: { item in
            self.items.append(item)
            self.listItems.accept(self.items)
            self.itemsCount.accept((self.items.count > 0) ? "\(self.items.count)" : "")
        }).disposed(by: disposeBag)
    }
    
    func onViewDidLoad() {
        self.interactor?.fetchMenu()
        self.interactor?.fetchBanners()
    }
    
    func onBannerFetched(_ banner: FDBannerResponseEntity) {
        self.view?.showBanners(banner)
    }
    
    func onMenuFetched(_ menu: [FDHomeMenuEntityProtocol]) {
        menuLists.accept(menu)
    }
    
    func showCart() {
        self.router.navigateToCart()
    }
}
