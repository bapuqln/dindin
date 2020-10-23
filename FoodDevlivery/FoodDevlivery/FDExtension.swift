//
//  FDExtension.swift
//  FoodDevlivery
//
//  Created by ACE_xW on 20/10/2020.
//

import Foundation
import UIKit
import SnapKit

public extension String {
    static let fd_BaseUrl = "https://dindinnfooddeliver.com/"
    static let fd_path_menu = "menu"
    static let fd_path_banner = "banner"
    static let fd_contentType = "Content-type"
    static let fd_applicationJson = "application/json"
}

public extension UIView {
    var safeArea:  ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        }
        return self.snp
    }
}

public extension String {
    func fd_urlEncode() -> URL? {
        guard let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed) else {
            return URL(string: "")
        }
        return URL(string: encodeUrlString)
    }
}

public extension UIImageView {
    func fd_imageFrom(_ urlString: String) {
        guard let url = urlString.fd_urlEncode() else {
            return
        }
        let indicator = UIActivityIndicatorView(style: .large)
        self.addSubview(indicator)
        indicator.snp.makeConstraints { $0.center.equalToSuperview() }
        indicator.startAnimating()
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard let data = data else { return }
            if error == nil {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    indicator.removeFromSuperview()
                    self.image = image
                }
            }
        }).resume()
    }
}

public extension UIButton {
  func setBackgroundColor(_ color: UIColor, for forState: UIControl.State) {
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
    UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    self.setBackgroundImage(colorImage, for: forState)
  }
}
