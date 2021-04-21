//
//  TabbarViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit
import IQKeyboardManager

class TabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        setupTabbar()
        
        setupTabbarParameters()
        
        setupKeyboards()
    }
    
    
    // MARK:- Setup functions
    func setupTabbar() {
        let vc1 = UINavigationController.init(rootViewController: TransactionsViewController());
        vc1.tabBarItem.title = "Transactions"; vc1.tabBarItem.image = #imageLiteral(resourceName: "stock-market");
        
        let vc2 = UINavigationController.init(rootViewController: ConverterViewController());
        vc2.tabBarItem.title = "Converter"; vc2.tabBarItem.image = #imageLiteral(resourceName: "dollar-2");
        
        viewControllers = [vc1, vc2]
    }
    
    func setupTabbarParameters() {
        tabBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1); tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        tabBar.backgroundColor = .white; tabBar.barTintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Font.mullerMedium, size: 14)!],
                                                         for: .normal)
    }
    
    func setupKeyboards() {
        IQKeyboardManager.shared().toolbarDoneBarButtonItemText = "Done"
        IQKeyboardManager.shared().isEnabled = true
    }
}
