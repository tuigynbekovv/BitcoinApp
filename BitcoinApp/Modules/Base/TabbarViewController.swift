//
//  TabbarViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

class TabbarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    // MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        setupTabbar()
        
        setupTabbarParameters()
    }
    
    
    // MARK:- Setup functions
    func setupTabbar() {
        let vc1 = UINavigationController.init(rootViewController: TransactionsViewController());
        vc1.tabBarItem.title = "TradeView"; vc1.tabBarItem.image = #imageLiteral(resourceName: "stock-market");
        
        viewControllers = [vc1]
    }
    
    func setupTabbarParameters() {
        tabBar.tintColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        tabBar.backgroundColor = .white
        tabBar.barTintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Font.mullerRegular, size: 12)!],
                                                         for: .normal)
    }
}
