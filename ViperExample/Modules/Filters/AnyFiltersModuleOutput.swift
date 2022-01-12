//
//  FiltersModuleOutput.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

protocol AnyFiltersModuleOutput: AnyObject {
    
    func filtersBeenChanged(_ newFilters: Filters)

}
