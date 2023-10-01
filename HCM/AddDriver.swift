//
//  AddDriver.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 28/9/23.
//

import SwiftUI
import SwiftData

struct AddDriver: View {
    @State var licenseNumber: String = ""
    @State var licenseType: String = ""
    @State var effectiveDate: Date = Date()
    @State var expirationDate: Date = Date()
    @State var ownerName: String = ""
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Owner", text: $ownerName)
            }
            
            Section("License") {
                TextField("License Number", text: $licenseNumber)
                TextField("License Type", text: $licenseType)
                DatePicker("Effective Date", selection: $effectiveDate)
                DatePicker("Expire Date", selection: $expirationDate)
            }
            /*
            Section {
                VStack {
                    Button("Save") {
                        print("save")
                        addData()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            */
            
        }
        .toolbar {
            ToolbarItem {
                Button(action: {
                    debugPrint("click Save")
                    addData()
                }, label: {
                    Text("Save")
                })
            }
        }
    }
    
    func addData() {
       // let person = Person(name: ownerName, licenseInfo: License(type: licenseType, effective_date: effectiveDate, expiration_date: expirationDate, registrationID: licenseNumber))
        let person = Person(name: ownerName, licenseInfo: LicenseData(type: licenseType, effective_date: effectiveDate, expiration_date: expirationDate, registrationID: licenseNumber))
        modelContext.insert(person)
        dismiss()
    }
    
    
      
    
}

#Preview {
    AddDriver(licenseNumber: "",
              licenseType: "",
              effectiveDate: Date(),
              expirationDate: Date(),
              ownerName: "")
}
