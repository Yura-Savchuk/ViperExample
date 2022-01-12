//
//  ProductCell.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!
    
    func populate(with product: Product) {
        titleLabel.text = "\(product.manufacture) \(product.model)"
        priceLabel.text = "\(product.price) UAH"
    }

}
