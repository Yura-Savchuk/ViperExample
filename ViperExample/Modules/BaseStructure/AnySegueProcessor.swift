//
//  AnySegueProcessor.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 12.01.2022.
//

import UIKit

protocol AnySegueProcessor {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) -> Bool

}
