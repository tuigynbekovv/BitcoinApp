//
//  HeaderView.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Properties
    lazy var iconLive = UIImageView(image: #imageLiteral(resourceName: "live"))
    lazy var highTitle: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.font = UIFont.init(name: Font.mullerBold, size: 13)
        return label
    }()
    lazy var lowTitle: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        label.font = UIFont.init(name: Font.mullerBold, size: 13)
        return label
    }()
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "-"; label.textColor = #colorLiteral(red: 0.4629748292, green: 0.4629748292, blue: 0.4629748292, alpha: 1); label.font = UIFont.init(name: Font.mullerRegular, size: 14);
        return label
    }()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Autolayout
    func setupViews() {
        backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        
        addSubviews([iconLive,highTitle,lowTitle, date])
        iconLive.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
        }
        highTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        lowTitle.snp.makeConstraints { (make) in
            make.top.equalTo(highTitle.snp.bottom).offset(5)
            make.right.equalToSuperview().offset(-15)
        }
        date.snp.makeConstraints { (make) in
            make.top.equalTo(iconLive.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
        }
    }
}
