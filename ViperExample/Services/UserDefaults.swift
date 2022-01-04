//
//  UserDefaults.swift
//  ViperExample
//
//  Created by Yura Savchuk on 31.12.2021.
//

import Foundation

extension UserDefaults {
    
    static var userToken: String? {
        get { string(forKey: .userToken) }
        set { setValue(newValue, forKey: .userToken) }
    }
    
}

private extension UserDefaults {
    
    enum Keys: String {
        case userToken
    }
    
    static func setValue(_ value: Any?, forKey key: Keys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    static func string(forKey key: Keys) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
    
}
