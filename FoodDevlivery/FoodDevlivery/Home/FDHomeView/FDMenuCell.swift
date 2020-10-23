//
//  FDMenuCell.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//

import UIKit
import RxSwift
import QuartzCore

class FDMenuCell: UITableViewCell {
    static let identifier = "FDMenuCell"
        
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuDescription: UILabel!
    @IBOutlet weak var menuDelivery: UILabel!
    @IBOutlet weak var menuAdd: UIButton!
    @IBOutlet weak var WrapperView: UIView!
    
    private(set) var disposeBag = DisposeBag()
    
    @IBAction func addOne(sender: AnyObject) {
        self.menuAdd.alpha = 1.0
        UIView.animate(withDuration: 0.5, delay: 0.25, options: []) {
            self.menuAdd.alpha = 0.0
            self.menuAdd.titleLabel?.text = "added +1"
        } completion: { _ in
            self.menuAdd.alpha = 1
        }
    }

    override func prepareForReuse() {
       super.prepareForReuse()
       disposeBag = DisposeBag() // because life cicle of every cell ends on prepare for reuse
    }
}


extension FDMenuCell: FDCellConfigProtocol {
    typealias CellEntity = FDHomeMenuEntityProtocol
    
    func configCell(with entity: FDHomeMenuEntityProtocol) {
        menuImage.fd_imageFrom(entity.imageUrl ?? "")
        menuImage.contentMode = .scaleToFill
        menuName.text = entity.name
        menuDescription.text = entity.description
        menuDelivery.text = entity.description
        menuAdd.setTitle("\(entity.prices ?? 0) usd", for: .normal)
        self.WrapperView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
