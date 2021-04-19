//
//  Extension.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

extension UITableViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
extension UICollectionViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

//  MARK: - UIView
extension UIView {
    func addSubviews(_ views : [UIView]) -> Void {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
}
