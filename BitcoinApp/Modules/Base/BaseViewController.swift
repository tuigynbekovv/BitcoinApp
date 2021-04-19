//
//  BaseViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    lazy var navTitle: UILabel = {
        let label = UILabel()
        label.text = "Bitcoins"
        label.font = UIFont.init(name: Font.mullerBold, size: 13)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        setupNavigation()
    }
    
    
    // MARK: - Functions
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navTitle)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIImageView(image: #imageLiteral(resourceName: "bitcoin")))
    }
}
