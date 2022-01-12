//
//  CatalogViewController.swift
//  ViperExample
//
//  Created by Yura Savchuk on 04.01.2022.
//

import UIKit

class CatalogViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var output: AnyCatalogPresenter?
    private let dataDisplayManager = CatalogDataDisplayManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataDisplayManager
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        output?.viewDidLoad()
    }

}

extension CatalogViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectProduct(at: indexPath.row)
    }
    
}

extension CatalogViewController: AnyCatalogView {
    
    func presentActivityIndicator() {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    func displayProducts(_ products: [Product]) {
        dataDisplayManager.products = products
        tableView.reloadData()
    }
    
    func presentAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
