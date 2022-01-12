//
//  AnyCatalogInteractorOutput.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

protocol AnyCatalogInteractorOutput: AnyObject {
    
    func didLoadProducts(_ products: [Product])
    func failedToLoadProducts(_ error: Error)

}
