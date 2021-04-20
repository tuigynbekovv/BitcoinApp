//
//  Extension.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit
import MBProgressHUD


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


extension UIViewController {
    func showHUD() -> Void {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    func dismissHUD() -> Void {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}


extension String {
    func convertTimesTamp(_ str: String) -> String {
        let nsdate = NSDate(timeIntervalSince1970: Double(str)!)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM dd YYYY hh:mm a"
        return dayTimePeriodFormatter.string(from: nsdate as Date)
    }
}
