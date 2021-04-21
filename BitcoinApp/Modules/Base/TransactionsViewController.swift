//
//  TransactionsViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 19.04.2021.
//

import UIKit

class TransactionsViewController: BaseViewController {
    
    var transactionsArray = [TransactionsModel]()
    
    // MARK: - Properties
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    lazy var headerView = HeaderView()
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(TransactionsTableViewCell.self, forCellReuseIdentifier: TransactionsTableViewCell.cellIdentifier())
        table.delegate = self; table.dataSource = self; //table.separatorStyle = .none
        let header = headerView
        header.frame.size = CGSize(width: 0, height: 80)
        table.tableHeaderView = header
        table.refreshControl = refreshControl
        return table
    }()
    
        
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        getLive()
    }
    
    
    // MARK: - Simple Functions
    func addingHeader(model: LiveModel) {
        headerView.date.text = "".convertTimesTamp(model.timestamp)
        headerView.highTitle.text = "High: " + model.high + " $"
        headerView.lowTitle.text = "Low: " + model.low + " $"
    }
    
    
    // MARK: - Autolayout
    func setupViews() {
        view.addSubviews([tableView])
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Actions
    @objc private func refresh() -> Void {
        refreshControl.endRefreshing()
    }
}


// MARK: - UITableView Protocols
extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionsTableViewCell.cellIdentifier(), for: indexPath) as! TransactionsTableViewCell
        
        cell.configure(model: transactionsArray[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailTransactionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


// MARK: - Parser
extension TransactionsViewController {
    private func getLive() -> Void {
        showHUD()
        ParseManager.shared.getRequest(url: "www.bitstamp.net/api/ticker") { (result: LiveModel?, error) in
            if let error = error {
                print(error)
                return
            }
            self.addingHeader(model: result!)
            self.getTransactions()
        }
    }
    private func getTransactions() -> Void {
        let parameter: [String : Any] = ["offset": 0, "limit": 500, "sort": "desc"]
        
        ParseManager.shared.getRequest(url: "www.bitstamp.net/api/transactions/", parameters: parameter) { (result: [TransactionsModel]?, error) in
            self.dismissHUD()
            if let error = error {
                print(error)
                return
            }
            self.transactionsArray = result!
            self.tableView.reloadData()
        }
    }
}
