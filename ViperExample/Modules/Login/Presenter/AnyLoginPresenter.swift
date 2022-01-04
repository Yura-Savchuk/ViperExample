//
//  AnyLoginPresenter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 30.12.2021.
//

protocol AnyLoginPresenter {
    
    func didTapInfo()
    func didTapLogin(_ userName: String, _ password: String)

}
