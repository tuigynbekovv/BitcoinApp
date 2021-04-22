//
//  ConverterViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 21.04.2021.
//

import UIKit

class ConverterViewController: BaseViewController {

    // MARK: - Properties
    lazy var iconImageView = UIImageView(image: #imageLiteral(resourceName: "bitcoin-4"))
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "-"; label.textColor = #colorLiteral(red: 0.5551562064, green: 0.5551562064, blue: 0.5551562064, alpha: 1); label.font = UIFont.init(name: Font.mullerRegular, size: 13);
        return label
    }()
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = "-"; label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); label.font = UIFont.init(name: Font.mullerBold, size: 16);
        return label
    }()
    lazy var converterView = ConverterView()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        getLive()
    }
    
    
    // MARK: - Setup Autolayout
    func setupViews() -> Void {
        scrollView.addSubviews([iconImageView, date, price, converterView])
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(90)
            make.right.equalToSuperview().offset(-15)
        }
        date.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(15)
        }
        price.snp.makeConstraints { (make) in
            make.top.equalTo(date.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(15)
        }
        converterView.snp.makeConstraints { (make) in
            make.top.equalTo(price.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.centerX.equalToSuperview()
        }
    }
}


// MARK: - Parser
extension ConverterViewController {
    private func getLive() -> Void {
        showHUD()
        ParseManager.shared.getRequest(url: Api.ticker) { (result: LiveModel?, error) in
            self.dismissHUD()
            if let error = error {
                print(error)
                return
            }
            self.date.text = self.convertTimesTamp(result!.timestamp)
            self.price.text = DefaultTitle.price + result!.last + " $"
            self.converterView.bitcoinPrice = Float(result!.last)!
        }
    }
}
