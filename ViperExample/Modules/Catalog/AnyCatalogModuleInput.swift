//
//  AnyCatalogModuleInput.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 12.01.2022.
//

protocol AnyCatalogModuleInput: AnyObject {
    
    func refreshProducts(with filters: Filters)

}
