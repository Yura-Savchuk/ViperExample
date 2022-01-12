//
//  AnyFiltersView.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

protocol AnyFiltersView: AnyObject {
    
    func manufacture() -> String?
    func maxPrice() -> Float?
    func minPrice() -> Float?
    
    func setManufacture(_ manufacture: String?)
    func setMaxPrice(_ maxPrice: Float?)
    func setMinPrice(_ minPrice: Float?)

}
