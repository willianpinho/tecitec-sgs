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
    
    static func getUser(request: Request) throws -> (Usuario?) {
        let session = try request.assertSession()
        if let userId = session.data["user_id"]?.string  {
            let user = try Usuario.find(userId.int)
            return user!
        } else {
            return nil
        }
        
        
    }
}
