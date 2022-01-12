//
//  HomePresenter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

class HomePresenter: AnyHomePresenter {

    weak var catalogModuleInput: AnyCatalogModuleInput?
    var router: AnyHomeRouter!
    var interactor: AnyHomeInteractor!
    
    private var filters: Filters?
    
    func didTapLogout() {
        interactor.logout()
        router?.presentLogin()
    }
    
    func didTapFilterButton() {
        router?.presentFilters(filters, self)
    }
    
}

extension HomePresenter: AnyFiltersModuleOutput {
    
    func filtersBeenChanged(_ newFilters: Filters) {
        filters = newFilters
        catalogModuleInput?.refreshProducts(with: newFilters)
    }
    
}

extension HomePresenter: AnyCatalogModuleInputDependable {
    
    func catalogModuleInputBeenPrepared(_ catalogModuleInput: AnyCatalogModuleInput) {
        self.catalogModuleInput = catalogModuleInput
    }
    
}
