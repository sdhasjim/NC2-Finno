//
//  Persistence.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 27/07/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Notes")
        
        container.loadPersistentStores {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error : \(error)")
            }
        }
    }
}
