//
//  FiltersRouter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

import UIKit

class FiltersRouter: AnyFiltersRouter {
    
    private struct Segues {
        static let close = "close"
    }

    weak var viewController: UIViewController?
    
    func close() {
        viewController?.performSegue(withIdentifier: Segues.close, sender: nil)
    }
    
}
