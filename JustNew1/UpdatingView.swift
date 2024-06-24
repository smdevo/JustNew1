//
//  UpdatingView.swift
//  JustNew1
//
//  Created by Samandar on 24/06/24.
//

import SwiftUI

struct UpdatingView: View {
    
    @Environment(\.managedObjectContext) var mContext
    
    @Environment(\.presentationMode) var pMode
    
    @Binding var person: Person?
    
    
    
    @State  var nametxt: String = ""
    @State  var agetxt: String = ""
    
    var body: some View {
        
        
        NavigationView {
            
            
            ScrollView {
                
                
                VStack(spacing: 20) {
                    
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height / 6)
                    
                    Text("Updating Person")
                        .font(.largeTitle)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        .shadow(radius: 10,x: 10,y: 10)
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Name:")
                            .font(.title2)
                        
                        TextField("Update Name", text: $nametxt)
                            .padding()
                            .background(.gray.opacity(0.3))
                            .cornerRadius(10)
                        
                        
                        Text("Age:")
                            .font(.title2)
                        
                        
                        TextField("Update Age", text: $agetxt)
                            .padding()
                            .background(.gray.opacity(0.3))
                            .cornerRadius(10)
                            .keyboardType(.numberPad) // Ensures numeric keyboard
                        
                    }//InVstack
                    
                    Spacer()
                    
                    Button {
                        
                        updatingAction()
                        
                    } label: {
                        Text("Update")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                        
                        
                    }
                    
                    
                    
                }//Vstack
                .padding()
                
                
            }//ScrollView
            .onAppear {
                nametxt = person?.name ?? "Unknown U person"
                agetxt = String(person?.age ?? 0)
            }
            .navigationTitle("Updating")
            .navigationBarItems(trailing: Button(action: {pMode.wrappedValue.dismiss()}, label: {Text("Back")}))
            
        }//NavView
            
    
    }//body
    
    
    func updatingAction() {
        
        guard !nametxt.isEmpty && !agetxt.isEmpty else {
            return
        }
        
        let person = self.person
        person?.name = nametxt
        person?.age = Int64(agetxt) ?? 20
      //person.id = UUID()
        
        do {
            try mContext.save()
        }catch{
            fatalError()
        }
        
        pMode.wrappedValue.dismiss()
    }
    
    
    
}

//struct UpdatingView_Previews: PreviewProvider {
//    var person = Person(context: PersistenceController.shared.persistentContainer.viewContext)
//
//    static var previews: some View {
//        UpdatingView(person: $person)
//    }
//}

