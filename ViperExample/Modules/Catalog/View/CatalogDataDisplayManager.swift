//
//  CatalogDataDisplayManager.swift
//  ViperExample
//
//  Created by Yura Savchuk on 05.01.2022.
//

import UIKit

class CatalogDataDisplayManager: NSObject, UITableViewDataSource {
    
    private let productCellIdentifier = "product"
    
    var products: [Product] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productCellIdentifier, for: indexPath) as! ProductCell
        cell.populate(with: products[indexPath.row])
        return cell
    }

}
