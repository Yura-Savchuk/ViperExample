//
//  LoginIteractor.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 30.12.2021.
//

class LoginIteractor {

    weak var output: AnyLoginInteractorOutput?
    private let loginService = LoginService()
    
}

extension LoginIteractor: AnyLoginInteractor {
    
    func loginUser(_ userName: String, _ password: String) {
        loginService.login(userName, password) { [weak self] result in
            self?.onLoginUser(result)
        }
    }
    
    private func onLoginUser(_ result: Result<Any?, Error>) {
        switch result {
        case .success(_):
            output?.didLoginUser()
            break
        case .failure(let error):
            output?.failedToLoginUser(error)
            break
        }
    }
    
}
