//
//  FDHomeProtocols.swift
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

//MARK: MenuEnity -
protocol FDHomeMenuEntityProtocol {
    var identifier: String? { get }
    var name: String? { get }
    var description: String? { get }
    var imageUrl: String? { get }
    var deliveryDescription: String? { get }
    var prices: Int? { get }
}

//MARK: Wireframe -
protocol FDHomeWireframeProtocol: class {
    func navigateToCart()
}
//MARK: Presenter -
protocol FDHomePresenterProtocol: class {
    var interactor: FDHomeInteractorProtocol? { get set }

    var addItem: PublishSubject<FDMenuResponse.Menu>{get}
    var itemsCount: BehaviorRelay<String>{get}
    
    var menuLists: BehaviorRelay<[FDHomeMenuEntityProtocol]>{get}
    
    func onViewDidLoad()
    func onMenuFetched(_ menu: [FDHomeMenuEntityProtocol])
    func onBannerFetched(_ banner: FDBannerResponseEntity)
    func showCart()
}

//MARK: Interactor -
protocol FDHomeInteractorProtocol: class {
    var presenter: FDHomePresenterProtocol?  { get set }
    var fetchedMenu: [FDMenuResponse.Menu] { get }
    func fetchMenu()
    func fetchBanners()
}

//MARK: View -
protocol FDHomeViewProtocol: class {
    var presenter: FDHomePresenterProtocol?  { get set }
    func showBanners(_ entity: FDBannerResponseEntity)
}
