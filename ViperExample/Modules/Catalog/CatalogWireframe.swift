//
//  CatalogWireframe.swift
//  ViperExample
//
//  Created by Yura Savchuk on 04.01.2022.
//

import UIKit

protocol AnyCatalogModuleInputDependable: AnyObject {
    
    func catalogModuleInputBeenPrepared(_ catalogModuleInput: AnyCatalogModuleInput)
    
}

class CatalogWireframe {
    
    weak var catalogModuleInputDependable: AnyCatalogModuleInputDependable?
    
    func setupModule(_ vc: CatalogViewController, router: AnyCatalogRouter) {
        let presenter = CatalogPresenter()
        let interactor = CatalogInteractor()

        vc.output = presenter

        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
        
        catalogModuleInputDependable?.catalogModuleInputBeenPrepared(presenter)
    }

}
