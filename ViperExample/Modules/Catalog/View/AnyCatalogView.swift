//
//  AnyCatalogView.swift
//  ViperExample
//
//  Created by Yura Savchuk on 04.01.2022.
//

protocol AnyCatalogView: AnyObject {
    
    func presentActivityIndicator()
    func hideActivityIndicator()
    func displayProducts(_ products: [Product])
    func presentAlert(_ title: String, _ message: String)

}
