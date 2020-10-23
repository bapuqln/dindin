//
//  FDCartTableAdapter.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 24/10/2020.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class FDCartTableAdapter: NSObject {
    public enum operationType {
        case contentSizeChange, add
    }
    
    private let disposeBag = DisposeBag()
    
    public typealias operationClosure = (_ index: FDCartTableAdapter.operationType) -> Void
    public var onOperation: operationClosure = {_ in }

    public func operation(_ onOperate:@escaping operationClosure) {
        self.onOperation = onOperate
    }

    private var tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.register(UINib(nibName: String(describing: FDCartItemCell.self), bundle: nil), forCellReuseIdentifier: FDCartItemCell.identifier)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        self.tableView.allowsSelection = false
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.tableView.layer.removeAllAnimations()
        self.onOperation(.contentSizeChange)
    }
    
    func bind(_ presenter: FDCartPresenterProtocol?) {
        presenter?.cartItem.asObservable().bind(to:self.tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: FDCartItemCell.identifier) as! FDCartItemCell
            cell.configCell(with: element)
            return cell
        }.disposed(by: disposeBag)
    }
    
    deinit {
        self.tableView.removeObserver(self, forKeyPath: "contentSize", context: nil)
    }
}
