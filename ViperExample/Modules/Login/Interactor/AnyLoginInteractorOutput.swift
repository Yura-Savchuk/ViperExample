//
//  AnyLoginInteractorOutput.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 30.12.2021.
//

import Foundation

protocol AnyLoginInteractorOutput: AnyObject {
    
    func didLoginUser()
    func failedToLoginUser(_ error: Error)
    
}
