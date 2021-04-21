//
//  DefaultTextField.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 21.04.2021.
//

import UIKit

class DefaultTextField: UITextField {

    
    //  MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        let space = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 0))
        leftView = space
        leftViewMode = .always
        
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        
        font = UIFont(name: Font.mullerBold, size: 15)
        
        keyboardType = .numberPad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
