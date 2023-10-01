//
//  ContentView.swift
//  HCM
//
//  Created by Saw Pyae Yadanar on 28/9/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var navigated = false
    @State private var isEdit = false
    @State private var selectedPerson: Person? = nil
    @Environment(\.modelContext) private var context
    @State private var inputText = ""
    @Query private var personAry: [Person]
    var body: some View {
        NavigationView {
            
            List {
                ForEach(personAry) { person in
                   
                    
                    NavigationLink {
//                        EditView(name: person.name , person: person) { updated in
//                                updateData(person: updated)
//                            }
                    } label: {
                        Text(person.name)
                      //  Text(person.licenseInfo.registrationID)
                    }

                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(personAry[index])
                    }
                }
                
            }
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Spacer()
                    NavigationLink("Add",
                                   destination:  AddDriver(),
                                   isActive: $navigated)
                    
                    //                          Button(action: { self.navigated.toggle() },
                    //                                 label: {
                    //
                    //                          })
                    
                }
            }
            .navigationTitle("Driver List")
        }
        
        .onAppear(perform: {
            //            let person = Person(name: "Saw")
            //            context.insert(person)
            //            
            //            let person2 = Person(name: "Pyae")
            //            context.insert(person2)
            //
            //            let person3 = Person(name: "Yadanar")
            //            context.insert(person3)
        })
    }
    
    func updateData(person: Person) {
  
        //person.name = ""
        do {
            try context.save()
        } catch (let error) {
            debugPrint(error.localizedDescription)
        }
    }
    
}

#Preview {
    ContentView()
}
