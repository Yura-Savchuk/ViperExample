//
//  LoginRouter.swift
//  ViperExample
//
//  Created by Yura Savchuk on 31.12.2021.
//

import UIKit

class LoginRouter: AnyLoginRouter {
    
    struct Segues {
        static let loginToInfo = "loginToInfo"
        static let loginToHome = "loginToHome"
    }
    
    var viewController: UIViewController?
    
    func presentLoginInfo() {
        viewController?.performSegue(withIdentifier: Segues.loginToInfo, sender: nil)
    }
    
    func presentHome() {
        viewController?.performSegue(withIdentifier: Segues.loginToHome, sender: nil)
    }
    
}

extension LoginRouter: AnySegueProcessor {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) -> Bool {
        if segue.identifier == Segues.loginToHome {
            let homeNavigationController = segue.destination as? UINavigationController
            if let homeVC = homeNavigationController?.viewControllers.first as? HomeViewController {
                HomeWireframe().setupModule(with: homeVC)
            }
            return true
        }
        return false
    }
    
}
