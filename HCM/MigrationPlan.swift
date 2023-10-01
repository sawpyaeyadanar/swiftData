//
//  MigrationPlan.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 29/9/23.
//

import Foundation
import SwiftData

enum MigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [HCMSchemaV1.self,
         HCMSchemaV2.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2]
    }
    
    
//    static let migrateV1toV2 = MigrationStage.custom(fromVersion: HCMSchemaV1.self,
//                                                      toVersion: HCMSchemaV2.self) { context in
//        let trips = try? context.fetch(FetchDescriptor<HCMSchemaV1.Person>())
//         try? context.save()
//     } didMigrate: { context in
//         
//     }
//    
    
    static let migrateV1toV2 = MigrationStage.lightweight(fromVersion: HCMSchemaV1.self, toVersion: HCMSchemaV2.self)
}
