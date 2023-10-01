//
//  EditView.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 29/9/23.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @State var name: String
    var person: Person
    var action: ((Person) -> Void)?
    var body: some View {
        VStack {
            Form {
                Section("Edit") {
                    TextField("", text: $name)
                }
            }
            VStack {
                Button {
                    person.name = name
                    action?(person)
                    dismiss()
                } label: {
                    Text("Edit")
                }
                .frame(minWidth: 300)
                .padding()
                .clipShape(.capsule)
                .background(Color.blue)
                .foregroundColor(Color.white)
                
                Spacer()
            }
           
           
        }
    }
}
//
//#Preview {
//    EditView(name: "Saw", person: Person(name: "Saw", licenseInfo: License(type: "", effective_date: Date(), expiration_date: Date(), registrationID: "")))
//}
