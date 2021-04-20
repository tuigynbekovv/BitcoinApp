//
//  TransactionsTableViewCell.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {

    // MARK: - Properties
    lazy var icon = UIImageView(image: #imageLiteral(resourceName: "bitcoin-1"))
    lazy var transactionID: UILabel = {
        let label = UILabel()
        label.text = "bitcoin_id"; label.textColor = .black; label.font = UIFont.init(name: Font.mullerMedium, size: 18);
        return label
    }()
    lazy var date: UILabel = {
        let label = UILabel()
        label.text = "16/02/2021"; label.textColor = #colorLiteral(red: 0.5551562064, green: 0.5551562064, blue: 0.5551562064, alpha: 1); label.font = UIFont.init(name: Font.mullerRegular, size: 14);
        return label
    }()
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = "200 000.00"; label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); label.font = UIFont.init(name: Font.mullerBold, size: 20);
        return label
    }()
    lazy var amount: UILabel = {
        let label = UILabel()
        label.text = "5 шт"; label.textColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1); label.font = UIFont.init(name: Font.mullerMedium, size: 15);
        return label
    }()
    lazy var type: UILabel = {
        let label = UILabel()
        label.text = "buy/sell"; label.textColor = #colorLiteral(red: 0.7843137255, green: 0.2039215686, blue: 0.2784313725, alpha: 1); label.font = UIFont.init(name: Font.mullerBold, size: 19);
        return label
    }()
    
        
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Autolayout
    func setupViews() {
        addSubviews([icon, transactionID, date, price, amount, type])
        
        icon.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(15)
        }
        transactionID.snp.makeConstraints { (make) in
            make.centerY.equalTo(icon.snp.centerY)
            make.left.equalTo(icon.snp.right).offset(10)
        }
        date.snp.makeConstraints { (make) in
            make.top.equalTo(icon.snp.bottom).offset(5)
            make.left.equalTo(transactionID.snp.left)
        }
        price.snp.makeConstraints { (make) in
            make.centerY.equalTo(icon.snp.centerY)
            make.right.equalToSuperview().offset(-15)
        }
        amount.snp.makeConstraints { (make) in
            make.top.equalTo(price.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-15)
        }
        type.snp.makeConstraints { (make) in
            make.top.equalTo(amount.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-25)
        }
    }
    
    
    // MARK: - Configure
    func configure(model: TransactionsModel) -> Void {
        transactionID.text = "ID:\(model.tid)"
        date.text = "".convertTimesTamp(model.date)
        price.text = model.price + " $"
        amount.text = model.amount + " amt"
        if model.type == 0 {
            type.text = "Buy"; type.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }else {
            type.text = "Sell"; type.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
}
