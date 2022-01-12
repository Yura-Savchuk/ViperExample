//
//  String+Comparason.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 12.01.2022.
//

import Foundation

extension String {
    
    func equalsIgnoringCase(to anotherString: String) -> Bool {
        return self.trimmedAndLowercased() == anotherString.trimmedAndLowercased()
    }
    
    private func trimmedAndLowercased() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }

}
