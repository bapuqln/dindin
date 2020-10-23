//
//  FDCartViewController.swift
//  FoodDevlivery
//
//  Created ACE_xW on 19/10/2020.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by ACE_xW
//

import UIKit

class FDCartViewController: UIViewController, FDCartViewProtocol {

	var presenter: FDCartPresenterProtocol?
    var cartTableViewAdapter: FDCartTableAdapter?

    @IBOutlet weak var cartView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCartTableView()
        self.presenter?.loadCartItems()
    }
}

extension FDCartViewController {
    func setupCartTableView() {
        self.cartTableViewAdapter = FDCartTableAdapter(tableView: self.cartView)
        self.cartTableViewAdapter?.bind(self.presenter)
    }
}
