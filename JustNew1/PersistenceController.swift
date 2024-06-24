//
//  MainDataController.swift
//  JustNew1
//
//  Created by Samandar on 23/06/24.
//

import Foundation
import CoreData

class PersistenceController: ObservableObject {
    
    static let shared = PersistenceController()
    
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        
       persistentContainer = NSPersistentContainer(name: "Container1")
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
    }
    
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            }catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
    }
    
}

