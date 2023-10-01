//
//  LicenseData.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 29/9/23.
//

import Foundation
import SwiftData

@Model
class LicenseData {
    let id = UUID().uuidString
    let type: String
    let effective_date: Date
    let expiration_date: Date
    @Attribute(.unique) let registrationID: String
    
    init(type: String, effective_date: Date, expiration_date: Date, registrationID: String) {
        self.type = type
        self.effective_date = effective_date
        self.expiration_date = expiration_date
        self.registrationID = registrationID
    }
    
    
}
