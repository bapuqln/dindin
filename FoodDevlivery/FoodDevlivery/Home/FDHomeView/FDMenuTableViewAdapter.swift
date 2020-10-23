//
//  FDHomeTableViewAdapter.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class FDMenuTableViewAdapter: NSObject {
    public enum operationType {
        case contentSizeChange, add
    }
    
    private let disposeBag = DisposeBag()
    
    public typealias operationClosure = (_ index: FDMenuTableViewAdapter.operationType) -> Void
    public var onOperation: operationClosure = {_ in }

    public func operation(_ onOperate:@escaping operationClosure) {
        self.onOperation = onOperate
    }

    private var tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.register(UINib(nibName: String(describing: FDMenuCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FDMenuCell.self))
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        self.tableView.allowsSelection = false
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.tableView.layer.removeAllAnimations()
        self.onOperation(.contentSizeChange)
    }
    
    func bind(_ presenter: FDHomePresenterProtocol?) -> FDMenuTableViewAdapter {
        presenter?.menuLists.asObservable().bind(to:self.tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: FDMenuCell.identifier) as! FDMenuCell
            cell.configCell(with: element)
            cell.menuAdd.rx.tap.subscribe({[unowned self] value in
                if let food = presenter?.interactor?.fetchedMenu.filter({$0.identifier == element.identifier}).first{
                    presenter?.addItem.onNext(food)
                    self.onOperation(.add)
                }
            }).disposed(by: cell.disposeBag)
            return cell
        }.disposed(by: disposeBag)
        
        return self
    }
    
    deinit {
        self.tableView.removeObserver(self, forKeyPath: "contentSize", context: nil)
    }
}
