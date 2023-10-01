//
//  Person.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 28/9/23.
//

import Foundation
import SwiftData

@Model
 class Person {
    let id = UUID().uuidString
     @Attribute(.unique) var name : String
     //var name : String
    let start_date = Date()
    let licenseInfo: LicenseData
    
     init(name: String, licenseInfo: LicenseData) {
         self.name = name
         self.licenseInfo = licenseInfo
     }
}
