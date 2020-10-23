//
//  FDCarditemCell.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//

import RxSwift
import UIKit

class FDCartItemCell: UITableViewCell{
    static let identifier = "FDCartItemCell"

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrices: UILabel!
    
    private(set) var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
       super.prepareForReuse()
       disposeBag = DisposeBag()
    }
}


extension FDCartItemCell: FDCellConfigProtocol {
    typealias CellEntity = FDCartItemEntityProtocol

    func configCell(with entity: FDCartItemEntityProtocol) {
        itemImage.fd_imageFrom(entity.imgURL ?? "")
        itemName.text = entity.name
        itemPrices.text = "\(entity.price ?? 0) usd"
    }
}
