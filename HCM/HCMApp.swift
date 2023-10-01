//
//  HCMApp.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 28/9/23.
//

import SwiftUI
import SwiftData

//typealias Person = HCMSchemaV2.Person
//typealias License = HCMSchemaV2.LicenseData
@main
struct HCMApp: App {
    
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: Person.self,
                                           migrationPlan: MigrationPlan.self)
//            container = try ModelContainer(for: Person.self, migrationPlan: MigrationPlan.self, configurations: ModelConfiguration(for: Person.self))
        } catch (let error) {
            fatalError("Could not initialise the container...\(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
       
      //  .modelContainer(for: Person.self)
        .modelContainer(container)
        
    }
}
