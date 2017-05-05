//
//  StockTableViewCell.swift
//  StooqPooq
//
//  Created by Karol Stępień on 04.05.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var indexNameLabel: UILabel!
    @IBOutlet weak var indexTimeLabel: UILabel!
    @IBOutlet weak var indexValueLabel: UILabel!
    var stockIndex = StockIndex()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indexValueLabel.layer.cornerRadius = 4.0
        indexValueLabel.clipsToBounds = true
        indexValueLabel.layer.backgroundColor = Colors.primary.cgColor
    }

    func configure(withStockIndex stock: StockIndex) {
        indexNameLabel.text = stock.name
        indexValueLabel.text = "\(stock.value)"
        indexTimeLabel.text = stock.time
        self.stockIndex = stock
    }
    
    func animateHighlight() {
        if let settings = PersistenceManager.sharedInstance.getSettings() {
            var components = DateComponents()
            components.second = settings.timerInterval * -1
            let beforeRefreshDate = Calendar.current.date(byAdding: components, to: Date())!
            
            if stockIndex.updated.isBetween(date: Date(), andDate: beforeRefreshDate) {
                indexValueLabel.layer.backgroundColor = Colors.accent.cgColor
                UIView.animate(withDuration: 1.0, delay: 1.0, animations: { [weak self] in
                    self?.indexValueLabel.layer.backgroundColor = Colors.primary.cgColor
                })
            }
        }
    }


}
