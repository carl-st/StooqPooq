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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indexValueLabel.layer.cornerRadius = 4.0
        indexValueLabel.clipsToBounds = true
    }

    func configure(withStockIndex stock: StockIndex) {
        indexNameLabel.text = stock.name
        indexValueLabel.text = "\(stock.value)"
        indexTimeLabel.text = stock.time
        if stock.updated == true {
            animateHighlight()
        }
    }
    
    func animateHighlight() {
        indexValueLabel.backgroundColor = Colors.accent
        UIView.animate(withDuration: 5.0, delay: 5.0, animations: { [weak self] in
            self?.indexValueLabel.backgroundColor = Colors.primary
        })
    }


}
