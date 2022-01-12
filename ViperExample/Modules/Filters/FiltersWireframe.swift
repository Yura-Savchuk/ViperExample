//
//  FiltersWireframe.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 12.01.2022.
//

class FiltersWireframe {
    
    var filters: Filters?
    var moduleOutput: AnyFiltersModuleOutput?
    
    func setupModule(_ vc: FiltersViewController) {
        let presenter = FiltersPresenter()
        let router = FiltersRouter()

        vc.output = presenter

        presenter.view = vc
        presenter.moduleOutput = moduleOutput
        presenter.router = router
        presenter.filters = filters
        
        router.viewController = vc
    }

}
