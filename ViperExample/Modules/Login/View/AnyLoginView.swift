//
//  AnyLoginView.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 30.12.2021.
//

protocol AnyLoginView: AnyObject {
    
    func presentActivityIndicator()
    func hideActivityIndicator()
    func presentAlert(_ title: String, _ message: String)

}
