//
//  HomeCatalogRouter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

import UIKit

class HomeCatalogRouter: AnyCatalogRouter {
    
    private struct Segues {
        static let showProduct = "showProduct"
    }
    
    weak var viewController: UIViewController?
    
    func presentProduct(_ product: Product) {
        viewController?.performSegue(withIdentifier: Segues.showProduct, sender: product)
    }

}

extension HomeCatalogRouter: AnySegueProcessor {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) -> Bool {
        if segue.identifier == Segues.showProduct {
            let productVC = segue.destination as? ProductViewController
            productVC?.product = sender as? Product
            return true
        }
        return false
    }
    
}
