//
//  SwiftUIView.swift
//  JustNew1
//
//  Created by Samandar on 23/06/24.
//

import SwiftUI

struct AddingView: View {
    
    @Environment(\.managedObjectContext) var mContext
    
    @Environment(\.presentationMode) var pMode
    
    
    
    @State private var nametxt: String = ""
    @State private var agetxt: String = ""
    
    var body: some View {
        
        ScrollView {
            
        
        VStack(spacing: 20) {
            
            Spacer()
                .frame(height: UIScreen.main.bounds.height / 6)
            
            Text("Adding Person")
                .font(.largeTitle)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 10,x: 10,y: 10)
            
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Name:")
                    .font(.title2)
                
                TextField("Enter Name", text: $nametxt)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                
                
                Text("Age:")
                    .font(.title2)
                
                
                TextField("Enter Age", text: $agetxt)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .keyboardType(.numberPad) // Ensures numeric keyboard
                
            }//InVstack
            
            Spacer()
            
            Button {
                
                addingAction()
                
            } label: {
                Text("Add")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .cornerRadius(10)
                
                
            }
            
          
            
        }//Vstack
        .padding()
       
        
     }//ScrollView
    
    }//body
    
    
    func addingAction() {
        
        guard !nametxt.isEmpty && !agetxt.isEmpty else {
            return
        }
        
        let person = Person(context: mContext)
        person.name = nametxt
        person.age = Int64(agetxt) ?? 20
        person.id = UUID()
        
        do {
            try mContext.save()
        }catch{
            fatalError()
        }
        
        pMode.wrappedValue.dismiss()
    }
    
    
    
}//AddingView

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddingView()
    }
}
