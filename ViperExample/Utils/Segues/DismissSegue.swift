//
//  DismissSegue.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

import UIKit

class DismissSegue: UIStoryboardSegue {
    
    override func perform() {
        source.dismiss(animated: true, completion: nil)
    }

}
