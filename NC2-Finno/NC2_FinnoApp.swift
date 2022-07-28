//
//  NC2_FinnoApp.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 25/07/22.
//

import SwiftUI

@main
struct NC2_FinnoApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
        //Hiding Title Bar
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
