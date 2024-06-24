//
//  ContentView.swift
//  JustNew1
//
//  Created by Samandar on 23/06/24.
//

import SwiftUI
import CoreData


extension Person {
    var wrappedID: UUID {
        id ?? UUID()
    }
}


struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) private var people: FetchedResults<Person>
    
    @Environment(\.managedObjectContext) private var mContext
    
    @State var isUPdate: Bool = false
    
    @State var currentPerson: Person?
    
    
    
    
    var body: some View {

        NavigationView {
            
            List {
                
                ForEach(people, id: \.wrappedID) { person in
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                                               
                                               Text(person.name ?? "Unknown C Person")
                                               
                                               Text(String(person.age))
                                           }//Vstack
                        Spacer()
                        
                        Button(action: {isUPdate.toggle();currentPerson = person},
                               label: {Image(systemName: "pencil")})
                        
                        
                                     }//Hstack
                    
                    
                                }//Foreach
                .onDelete(perform: deletePerson)
                .sheet(isPresented: $isUPdate, content: {UpdatingView(person: $currentPerson)})
                
                
            }
            .navigationTitle("People")
            .navigationBarItems(trailing: navLink)
            
        }//NavView

    }//body
    
    func deletePerson(indexSet: IndexSet) {
        
        for index in indexSet {
           let person = people[index]
            
            mContext.delete(person)
        }
        
        do {
            try mContext.save()
        } catch {
            fatalError()
        }
        
    }
    
    
    var navLink: some View {
        let navLink = NavigationLink(destination: {AddingView()}, label: {Image(systemName: "plus")})
        
        return navLink
    }//NavLink
    
    
}//ContentView

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
