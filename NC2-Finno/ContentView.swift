//
//  ContentView.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 25/07/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var landingPageVMData = LandingPageViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)])
    private var notes: FetchedResults<Note>
    
    @State private var notesTitle: String = ""
    
    var body: some View {
        LandingPage()
        
            .toolbar {
                ToolbarItem {
//                    Button(action: addNote(notesTitle: notesTitle)) {
//                        Label("Add Item", systemImage: "plus")
//                    }
                    
//                    Button("Save") {
//                        addNote(title: notesTitle)
//                    }
//                    Button(action: updateNote(note)) {
//                        Label("Add Item", systemImage: "plus")
//                    }
                }
            }
//            .navigationBarItems(trailing: Button("Add Task") {
//                addNote()
//            })
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
