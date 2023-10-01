//
//  HCMSchemaV1.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 29/9/23.
//

import Foundation
import SwiftData

typealias HCMSchema = HCMSchemaV1.Person


enum HCMSchemaV1: VersionedSchema {
    
    
    static var models: [any PersistentModel.Type] {
        [Person.self]
    }
    
    static var versionIdentifier: Schema.Version = .init(1, 0, 0)
    
    @Model
     class Person {
        let id = UUID().uuidString
        var name : String
        let start_date = Date()
        
         init(name: String) {
             self.name = name
         }
    }

    
}

enum HCMSchemaV2: VersionedSchema {
    
    
    static var models: [any PersistentModel.Type] {
        [Person.self]
    }
    
    static var versionIdentifier: Schema.Version = .init(1, 0, 0)
    
    @Model
     class Person {
        let id = UUID().uuidString
         @Attribute(.unique) var name : String
        let start_date = Date()
        
         init(name: String) {
             self.name = name
         }
    }

    
}

enum HCMSchemaV3: VersionedSchema {
    
    
    static var models: [any PersistentModel.Type] {
        [Person.self, LicenseData.self]
    }
    
    static var versionIdentifier: Schema.Version = .init(1, 0, 1)
    
    @Model
     class Person {
        let id = UUID().uuidString
         @Attribute(.unique) var name : String
        let start_date = Date()
        let licenseInfo: LicenseData
        
         init(name: String, licenseInfo: LicenseData) {
             self.name = name
             self.licenseInfo = licenseInfo
         }
    }
    
    @Model
    class LicenseData {
        let id = UUID().uuidString
        let type: String
        let effective_date: Date
        let expiration_date: Date
        @Attribute(.unique) let registrationID: String
        var person: Person?
        
        init(type: String, effective_date: Date, expiration_date: Date, registrationID: String) {
            self.type = type
            self.effective_date = effective_date
            self.expiration_date = expiration_date
            self.registrationID = registrationID
        }
        
        
    }

    
}
