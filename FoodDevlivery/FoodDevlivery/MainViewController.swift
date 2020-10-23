//
//  ViewController.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 19/10/2020.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeRouter = FDHomeRouter.createModule()
        self.navigationController?.pushViewController(homeRouter, animated: false)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.title = "-----"
        // Do any additional setup after loading the view.
    }


}

