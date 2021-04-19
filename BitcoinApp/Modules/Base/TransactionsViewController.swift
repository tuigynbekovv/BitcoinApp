//
//  TransactionsViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

class TransactionsViewController: BaseViewController {
    
    // MARK: - Properties
    lazy var headerView = HeaderView()
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(TransactionsTableViewCell.self, forCellReuseIdentifier: TransactionsTableViewCell.cellIdentifier())
        table.delegate = self; table.dataSource = self; table.separatorStyle = .none
        let header = headerView
        header.frame.size = CGSize(width: 0, height: 100)
        table.tableHeaderView = header
        return table
    }()
    
        
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: - SetupViews
    func setupViews() {
        view.addSubviews([tableView])
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}


// MARK: - UITableView Protocols
extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionsTableViewCell.cellIdentifier(), for: indexPath) as! TransactionsTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
