//
//  CatalogInteractor.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

class CatalogInteractor: AnyCatalogInteractor {
    
    weak var output: AnyCatalogInteractorOutput?
    private let productsService = ProductsService()
   
    func loadProducts() {
        productsService.products { [weak self] result in
            switch result {
            case .success(let products):
                self?.output?.didLoadProducts(products)
                break
            case .failure(let error):
                self?.output?.failedToLoadProducts(error)
                break
            }
        }
    }

}
