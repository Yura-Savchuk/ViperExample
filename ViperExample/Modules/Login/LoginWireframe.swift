//
//  LoginWireframe.swift
//  ViperExample
//
//  Created by Yura Savchuk on 31.12.2021.
//

import Foundation
import UIKit

class LoginWireframe {
    
    func setupModule(with vc: LoginViewController) {
        let interactor = LoginIteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()

        vc.output = presenter

        presenter.interactor = interactor
        presenter.view = vc
        presenter.router = router

        interactor.output = presenter

        router.viewController = vc
    }

}
