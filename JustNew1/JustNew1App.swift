//
//  JustNew1App.swift
//  JustNew1
//
//  Created by Samandar on 23/06/24.
//

import SwiftUI

@main
struct JustNew1App: App {
    
    @StateObject var perController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, perController.persistentContainer.viewContext)
        }
    }
}
