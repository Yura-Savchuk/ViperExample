//
//  HomeViewController.swift
//  ViperExample
//
//  Created by Yura Savchuk on 30.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var output: AnyLoginPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginWireframe().setupModule(with: self)
    }
    
    @IBAction func didTapInfoBtn(_ sender: Any) {
        output?.didTapInfo()
    }
    @IBAction func didTapLoginBtn(_ sender: Any) {
        output?.didTapLogin(tfUserName.text ?? "",
                            tfPassword.text ?? "")
    }
    
}

extension LoginViewController: AnyLoginView {
    
    func presentActivityIndicator() {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    func presentAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

