//
//  HomeRouter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

import UIKit

class HomeRouter: AnyHomeRouter {
    
    private struct Segues {
        static let homeToLogin = "homeToLogin"
        static let homeToFilters = "homeToFilters"
        static let catalogToHome = "catalogToHome"
    }
    
    weak var viewController: UIViewController?
    weak var filtersModuleOutput: AnyFiltersModuleOutput?
    weak var catalogRouter: AnyCatalogRouter?
    weak var catalogModuleInputDependable: AnyCatalogModuleInputDependable?
    
    func presentLogin() {
        viewController?.performSegue(withIdentifier: Segues.homeToLogin, sender: nil)
    }
    
    func presentFilters(_ filters: Filters?, _ moduleOutput: AnyFiltersModuleOutput?) {
        let wireframe = FiltersWireframe()
        wireframe.filters = filters
        wireframe.moduleOutput = moduleOutput
        viewController?.performSegue(withIdentifier: Segues.homeToFilters, sender: wireframe)
    }

}

extension HomeRouter: AnySegueProcessor {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) -> Bool {
        if segue.identifier == Segues.homeToFilters {
            prepareFilters(for: segue, sender: sender)
            return true
        }
        else if segue.identifier == Segues.catalogToHome {
            prepareCatalog(for: segue, sender: sender)
        }
        return false
    }
    
    private func prepareFilters(for segue: UIStoryboardSegue, sender: Any?) {
        if let filtersVC = segue.destination as? FiltersViewController,
            let wireframe = sender as? FiltersWireframe {
            wireframe.setupModule(filtersVC)
        }
    }
    
    private func prepareCatalog(for segue: UIStoryboardSegue, sender: Any?) {
        if let catalogVC = segue.destination as? CatalogViewController {
            let wireframe = CatalogWireframe()
            wireframe.catalogModuleInputDependable = catalogModuleInputDependable
            wireframe.setupModule(catalogVC, router: catalogRouter!)
        }
    }
    
}
