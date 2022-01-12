//
//  CatalogPresenter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//
 
class CatalogPresenter: AnyCatalogPresenter {
    
    weak var view: AnyCatalogView?
    var interactor: AnyCatalogInteractor!
    var router: AnyCatalogRouter!
    private var filters: Filters?
    
    private var displayedProducts: [Product]?
    
    func viewDidLoad() {
        loadProducts()
    }
    
    private func loadProducts() {
        view?.presentActivityIndicator()
        interactor.loadProducts()
    }
    
    func didSelectProduct(at index: Int) {
        router.presentProduct(displayedProducts![index])
    }
    
}

extension CatalogPresenter: AnyCatalogModuleInput {
    
    func refreshProducts(with filters: Filters) {
        self.filters = filters
        loadProducts()
    }
    
}

extension CatalogPresenter: AnyCatalogInteractorOutput {
    
    func didLoadProducts(_ products: [Product]) {
        displayedProducts = products
        filterDisplayedProductsIfNeeded()
        view?.hideActivityIndicator()
        view?.displayProducts(displayedProducts!)
    }
    
    private func filterDisplayedProductsIfNeeded() {
        if filters != nil && !filters!.isEmpty() {
            displayedProducts = displayedProducts?.filter {$0.matches(filters!)}
        }
    }
    
    func failedToLoadProducts(_ error: Error) {
        view?.hideActivityIndicator()
        view?.presentAlert("Ошибка", error.localizedDescription)
    }
    
}
