//
//  ConverterViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 21.04.2021.
//

import UIKit

class ConverterViewController: BaseViewController {

    // MARK: - Properties
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "-"; label.textColor = #colorLiteral(red: 0.5551562064, green: 0.5551562064, blue: 0.5551562064, alpha: 1); label.font = UIFont.init(name: Font.mullerRegular, size: 14);
        return label
    }()
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = "-"; label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); label.font = UIFont.init(name: Font.mullerBold, size: 20);
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
        view.addSubviews([converterView, price, date])
        
        converterView.snp.makeConstraints { (make) in
            make.center.width.equalToSuperview()
        }
        price.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(converterView.snp.top).offset(-15)
        }
        date.snp.makeConstraints { (make) in
            make.right.equalTo(price.snp.right)
            make.bottom.equalTo(price.snp.top).offset(-5)
        }
    }
}


// MARK: - Parser
extension ConverterViewController {
    private func getLive() -> Void {
        showHUD()
        ParseManager.shared.getRequest(url: "www.bitstamp.net/api/ticker") { (result: LiveModel?, error) in
            self.dismissHUD()
            if let error = error {
                print(error)
                return
            }
            self.date.text = "".convertTimesTamp(result!.timestamp)
            self.price.text = result!.last + " $"
            self.converterView.bitcoinPrice = Float(result!.last)!
        }
    }
}
