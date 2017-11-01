//
//  Util.swift
//  TecitecPackageDescription
//
//  Created by Willian Pinho on 10/31/17.
//

import Foundation

class Util {
    static func formatStringCurrency(currency: String) -> Double {
        let modified = currency.replacingOccurrences(of: ",", with: ".")
        return Double(modified)!
    }
}
