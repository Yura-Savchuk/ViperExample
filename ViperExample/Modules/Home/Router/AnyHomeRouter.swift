//
//  AnyHomeRouter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

protocol AnyHomeRouter {

    func presentLogin()
    func presentFilters(_ filters: Filters?, _ moduleOutput: AnyFiltersModuleOutput?)
    
}
