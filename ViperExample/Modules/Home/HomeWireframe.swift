//
//  HomeWireframe.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

import Foundation

class HomeWireframe {

    func setupModule(with vc: HomeViewController) {
        let presenter = HomePresenter()
        let router = HomeRouter()
        let homeCatalogRouter = HomeCatalogRouter()

        vc.output = presenter
        vc.segueProcessors = [router, homeCatalogRouter]

        presenter.router = router
        presenter.interactor = HomeInteractor()

        router.viewController = vc
        router.catalogRouter = homeCatalogRouter
        router.catalogModuleInputDependable = presenter
        homeCatalogRouter.viewController = vc
    }
    
}
