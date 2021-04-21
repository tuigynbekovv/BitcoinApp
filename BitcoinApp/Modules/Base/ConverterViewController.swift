//
//  ConverterViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 21.04.2021.
//

import UIKit

class ConverterViewController: BaseViewController {

    // MARK: - Properties
    lazy var converterView = ConverterView()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: - Setup Autolayout
    func setupViews() -> Void {
        view.addSubviews([converterView])
        
        converterView.snp.makeConstraints { (make) in
            make.center.width.equalToSuperview()
        }
    }
}
