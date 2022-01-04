//
//  LoginPresenter.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 30.12.2021.
//

import Foundation

class LoginPresenter {
    
    weak var view: AnyLoginView?
    var interactor: AnyLoginInteractor?
    var router: AnyLoginRouter?

}

extension LoginPresenter: AnyLoginPresenter {
    
    func didTapInfo() {
        
    }
    
    func didTapLogin(_ userName: String, _ password: String) {
        view?.presentActivityIndicator()
        interactor?.loginUser(userName, password)
    }
    
}

extension LoginPresenter: AnyLoginInteractorOutput {
    
    func didLoginUser() {
        view?.hideActivityIndicator()
    }
    
    func failedToLoginUser(_ error: Error) {
        view?.hideActivityIndicator()
        view?.presentAlert("Ошибка", error.localizedDescription)
    }
    
}
