//
//  ProductViewController.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet private weak var manufactureLabel: UILabel?
    @IBOutlet private weak var modelLabel: UILabel?
    @IBOutlet private weak var priceLabel: UILabel?
    
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        manufactureLabel?.text = product?.manufacture
        modelLabel?.text = product?.model
        priceLabel?.text = "\(product?.price ?? 0) UAH"
    }

}
