//
//  DetailTransactionViewController.swift
//  BitcoinApp
//
//  Created by Tuigynbekov Yelzhan on 20.04.2021.
//

import UIKit

class DetailTransactionViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - Initialization
    init(transactionID: Int) {
        super.init(nibName: nil, bundle: nil)
        
        getTransactionInfo(ID: transactionID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Autolayout
    
}


// MARK: - Parser
extension DetailTransactionViewController {
    private func getTransactionInfo(ID: Int) {
        
    }
}
