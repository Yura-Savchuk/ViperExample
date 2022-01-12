//
//  HomeViewController.swift
//  ViperExample
//
//  Created by Yura Savchuk on 05.01.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var catalogPanelPlaceholder: UIView!
    @IBOutlet weak var catalogPlaceholder: UIView!
    
    var output: AnyHomePresenter?
    var segueProcessors: [AnySegueProcessor] = []
    private var homeCatalogRouter: HomeCatalogRouter?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        for segueProcessor in segueProcessors {
            if segueProcessor.prepare(for: segue, sender: sender) {
                return
            }
        }
    }
    
    @IBAction func didTapLogout(_ sender: Any) {
        output?.didTapLogout()
    }
    
    @IBAction func didTapFilterButton(_ sender: Any) {
        output?.didTapFilterButton()
    }
}
