//
//  HeaderView.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Properties
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup
    func setupViews() {
        backgroundColor = UIColor.orange.withAlphaComponent(0.5)
    }
}
