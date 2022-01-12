//
//  Filters.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

struct Filters {
    
    var manufacture: String?
    var maxPrice: Float?
    var minPrice: Float?
    
}

extension Filters {
    
    func isEmpty() -> Bool {
        manufacture?.isEmpty ?? true &&
        maxPrice == nil &&
        minPrice == nil
    }
    
}
