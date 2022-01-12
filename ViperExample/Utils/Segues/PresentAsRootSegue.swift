//
//  PresentAsRootSegue.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 10.01.2022.
//

import UIKit

class PresentAsRootSegue: UIStoryboardSegue {
    
    override func perform() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.keyWindow?.rootViewController = destination
        windowScene?.keyWindow?.makeKeyAndVisible()
    }

}
