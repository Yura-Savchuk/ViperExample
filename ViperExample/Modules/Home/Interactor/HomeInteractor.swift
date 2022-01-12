//
//  HomeInteractor.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

class HomeInteractor: AnyHomeInteractor {
    
    private let loginService = LoginService()
    
    func logout() {
        loginService.logout()
    }

}
