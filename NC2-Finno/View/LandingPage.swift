//
//  LandingPage.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 26/07/22.
//

import SwiftUI

var screen = NSScreen.main!.visibleFrame

struct LandingPage: View {
    
    @StateObject var landingPageVMData = LandingPageViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)])
    private var notes: FetchedResults<Note>
    
    @State private var notesTitle: String = ""
    @State private var notesContent: String = ""
    
    var body: some View {
        NavigationView {
            List {
                SearchBarTab(image: "magnifyingglass", title: "Search", selectedTab: $landingPageVMData.selectedTab, search: $landingPageVMData.search)
                Section(header: Text("Notes")) {
                    SideBarTab(image: "note.text", title: "My Notes", count: notes.count, selectedTab: $landingPageVMData.selectedTab)
                }
                Section(header: Text("Others")) {
                    SideBarTab(image: "person.2.fill", title: "Explore", count: 0, selectedTab: $landingPageVMData.selectedTab)
                }
                
                Spacer()
                
                Section(header: Text("Tags")) {
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 8))
                            .foregroundColor(.blue)
                        Text("Blue")
                    }
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 8))
                            .foregroundColor(.red)
                        Text("Red")
                    }
                }
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem {
                    HStack {
//                        Button(action: deleteNote) {
//                            Label("Add Item", systemImage: "trash")
//                                .font(.system(size: 17))
//                        }
                    }
                    
                    //                    Button(action: updateNote(note)) {
                    //                        Label("Add Item", systemImage: "plus")
                    //                    }
                }
            }
            switch landingPageVMData.selectedTab {
            case "My Notes":
                NavigationView {
                    List {
                        ForEach(notes) { note in
                            NavigationLink {
                                //                                Text(note.title ?? "Untitled")
                                VStack {
                                    Text("Created at \(note.date!, formatter: itemFormatter2)")
                                        .font(.system(size: 10))
                                        .foregroundColor(.secondary)
                                    TextField("Enter title", text: $notesTitle)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .padding()
                                        .font(.system(size: 22) .weight(.bold))
                                    TextField("Type your content here", text: $notesContent)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .padding()
                                        .font(.system(size: 13) .weight(.regular))
                                    Button(action: {
                                        updateNote(note)
                                    }, label: {
                                        Text("Update")
                                    })
                                    Spacer()
                                }.onAppear {
                                    notesTitle = note.title!
                                    notesContent = note.content!
//                                    if (note.title != "") {
//                                        notesTitle = note.title!
//                                    } else {
//                                        notesTitle = note.title!
//                                    }
//                                    if (note.content != "") {
//                                        notesContent = note.content!
//                                    }
                                }

                                //                            .onTapGesture(count: 3, perform: {
                                //                                updateNote(note)
                                //                            })
                            } label: {
                                VStack(alignment: .leading) {
                                    HStack {
                                        if (note.title! == "") {
                                            Text("New Note")
                                                .font(.system(size: 13) .weight(.semibold))
                                        } else {
                                            Text(note.title!)
                                                .font(.system(size: 13) .weight(.semibold))
                                        }
                                        
                                        Spacer()
                                        Text(note.date!, formatter: itemFormatter)
                                            .font(.system(size: 10))
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    if (note.content! == "") {
                                        Text("No additional text")
                                            .font(.system(size: 10) .weight(.regular))
                                            .padding(.vertical, 5)
                                    } else {
                                        Text(note.content!)
                                            .font(.system(size: 10) .weight(.regular))
                                            .padding(.vertical, 5)
                                    }
                                }
                            }
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action: {
                                    withAnimation {
                                        viewContext.delete(note)
                                        saveContext()
                                    }
                                    
                                }, label: {
                                    Text("Delete")
                                })
                            }))
                        }
                    }
                    //            .navigationBarItems(trailing: Button("Add Task") {
                    //                addNote()
                    //            })
                }
            case "Explore": Text("Explore")
            case "Search":
                VStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 72))
                    Text("Searching My Notes")
                        .font(.system(size: 18))
                }
            case "Edit": Text("Edit")
            case "Settings": Text("Settings")
            default: Text("")
            }
        }
        .environmentObject(landingPageVMData)
        
        .toolbar {
            ToolbarItem(placement: .navigation) {
                //                Button(action: addNote) {
                //                    Label("Add Item", systemImage: "plus")
                //                }
                Button(action: {addNote()}, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 17))
                })
            }
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    private func addNote() {
        withAnimation {
            let newNote = Note(context: viewContext)
            newNote.title = ""
            newNote.date = Date()
            newNote.content = ""
            
            saveContext()
        }
    }
    
    private func deleteNote(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach(viewContext.delete)
            
            saveContext()
        }
    }
    
    private func updateNote(_ note: FetchedResults<Note>.Element) {
        withAnimation {
            note.title = notesTitle
            note.content = notesContent
            saveContext()
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
//    formatter.dateStyle = .short
    formatter.dateFormat = "MMM dd"
    //    formatter.timeStyle = .medium
    return formatter
}()

private let itemFormatter2: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
            .preferredColorScheme(.light)
    }
}
