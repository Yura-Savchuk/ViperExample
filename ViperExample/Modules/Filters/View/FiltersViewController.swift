//
//  FiltersViewController.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 11.01.2022.
//

import UIKit

class FiltersViewController: UIViewController {
    
    @IBOutlet private weak var manufatureTextField: UITextField!
    @IBOutlet private weak var maxPriceTextField: UITextField!
    @IBOutlet private weak var minPriceTextField: UITextField!
    
    var output: AnyFiltersPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        output?.didTapCancel()
    }
    
    @IBAction func didTapApply(_ sender: Any) {
        output.didTapApply()
    }

}

extension FiltersViewController: AnyFiltersView {
    
    func manufacture() -> String? {
        manufatureTextField.text
    }
    
    func maxPrice() -> Float? {
        return textAsFloat(maxPriceTextField.text)
    }
    
    private func textAsFloat(_ text: String?) -> Float? {
        if text != nil {
            return Float(text!)
        }
        return nil
    }
    
    func minPrice() -> Float? {
        return textAsFloat(minPriceTextField.text)
    }
    
    func setManufacture(_ manufacture: String?) {
        manufatureTextField.text = manufacture
    }
    
    func setMaxPrice(_ maxPrice: Float?) {
        maxPriceTextField.text = floatAsText(maxPrice)
    }
    
    private func floatAsText(_ float: Float?) -> String? {
        if float != nil {
            return "\(float!)"
        }
        return nil
    }
    
    func setMinPrice(_ minPrice: Float?) {
        minPriceTextField.text = floatAsText(minPrice)
    }
    
}
