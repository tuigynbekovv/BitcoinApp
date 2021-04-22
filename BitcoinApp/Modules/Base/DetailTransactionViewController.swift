//
//  DetailTransactionViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 20.04.2021.
//

import UIKit

class DetailTransactionViewController: ScrollViewController {

    // MARK: - Properties
    var transactionsModel: TransactionsModel?
    
    lazy var iconImageView = UIImageView(image: #imageLiteral(resourceName: "bitcoin-3"))
    lazy var transactionID: UILabel = {
        let label = UILabel()
        label.text = ""; label.textColor = .black; label.font = UIFont.init(name: Font.mullerRegular, size: 16);
        return label
    }()
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "16/02/2021"; label.textColor = #colorLiteral(red: 0.5551562064, green: 0.5551562064, blue: 0.5551562064, alpha: 1); label.font = UIFont.init(name: Font.mullerRegular, size: 14);
        return label
    }()
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = "200 000.00"; label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); label.font = UIFont.init(name: Font.mullerMedium, size: 14);
        return label
    }()
    lazy var amount: UILabel = {
        let label = UILabel()
        label.text = "5 шт"; label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); label.font = UIFont.init(name: Font.mullerMedium, size: 14);
        return label
    }()
    lazy var type: UILabel = {
        let label = UILabel()
        label.text = "buy/sell"; label.textColor = #colorLiteral(red: 0.7843137255, green: 0.2039215686, blue: 0.2784313725, alpha: 1); label.font = UIFont.init(name: Font.mullerBold, size: 21);
        return label
    }()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: - Initialization
    init(transactionModel: TransactionsModel) {
        super.init(nibName: nil, bundle: nil)
            
        self.transactionsModel = transactionModel
        self.transactionID.text = "\(transactionModel.tid)"
        self.date.text = "Дата: " + convertTimesTamp(transactionModel.date)
        self.price.text = "Сумма: " + convertTimesTamp(transactionModel.price)
        self.amount.text = "Количество: " + convertTimesTamp(transactionModel.amount)
        if transactionsModel!.type == 0 {type.text = "Куплено"; type.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }else {type.text = "Продано"; type.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)}
        
        getTransactionInfo(ID: transactionModel.tid)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Autolayout
    func setupViews() {
        view.backgroundColor = .white
        
        scrollView.addSubviews([iconImageView, transactionID, date, price, amount, type])
        iconImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        transactionID.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
        }
        date.snp.makeConstraints { (make) in
            make.top.equalTo(transactionID.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(15)
        }
        price.snp.makeConstraints { (make) in
            make.top.equalTo(date.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(15)
        }
        amount.snp.makeConstraints { (make) in
            make.top.equalTo(price.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(15)
        }
        type.snp.makeConstraints { (make) in
            make.top.equalTo(amount.snp.bottom).offset(7)
            make.left.equalToSuperview().offset(15)
        }
    }
}


// MARK: - Parser
extension DetailTransactionViewController {
    private func getTransactionInfo(ID: Int) {
        
    }
}
