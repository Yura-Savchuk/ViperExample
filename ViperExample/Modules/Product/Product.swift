//
//  Product.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

struct Product: Decodable {
    let manufacture: String
    let model: String
    let price: Float
}

extension Product {
    
    func matches(_ filters: Filters) -> Bool {
        return filters.manufacture?.equalsIgnoringCase(to: manufacture) ?? true &&
            priceInBordersOf(filters.minPrice, filters.maxPrice)
    }
    
    func priceInBordersOf(_ minValue: Float?, _ maxValue: Float?) -> Bool {
        return (minValue == nil || price >= minValue!) &&
            (maxValue == nil || price <= maxValue!)
    }
    
}
