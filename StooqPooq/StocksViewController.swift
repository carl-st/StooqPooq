//
//  StocksViewController.swift
//  StooqPooq
//
//  Created by Karol Stępień on 29.04.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private var tableView: UITableView!
    private var viewModel: StocksViewModel?
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        viewModel = StocksViewModel(reload: { [weak self] in
            self?.tableView.reloadData()
            self?.highlightChanges()
        }, persistence: PersistenceManager.sharedInstance)
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let settings = PersistenceManager.sharedInstance.getSettings() {
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(settings.timerInterval), target: self, selector: #selector(refreshStockData), userInfo: nil, repeats: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    private func highlightChanges() {
        for i in 0..<tableView.numberOfRows(inSection: 0) {
            let cell = tableView.cellForRow(at: IndexPath(item: i, section: 0)) as? StockTableViewCell
            cell?.animateHighlightIfNeeded()
        }
    }
    
    dynamic private func refreshStockData() {
        print("refreshing...")
        GPWService.sharedInstance.fetchGPW()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.stocks.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellReuseIdentifier.stockCell.rawValue) as? StockTableViewCell {
        
            if let viewModel = viewModel {
                let stock = viewModel.stocks[indexPath.row]
                cell.configure(withStockIndex: stock)
                return cell
            }
        }
    
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

