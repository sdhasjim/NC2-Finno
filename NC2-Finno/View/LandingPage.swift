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
    
    var body: some View {
        //        SideBarSection(title: "Notes")
        //        SideBarTab(image: "note.text", title: "My Notes", selectedTab: $landingPageVMData.selectedTab)
        //        SideBarSection(title: "Others")
        //        SideBarTab(image: "person.2.fill", title: "Explore", selectedTab: $landingPageVMData.selectedTab)
        NavigationView {
            List {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $landingPageVMData.search)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                Section(header: Text("Notes")) {
                    //                    HStack {
                    //                        Image(systemName: "note.text")
                    //                            .foregroundColor(.blue)
                    //                        Text("My Notes")
                    //                    }
                    SideBarTab(image: "note.text", title: "My Notes", selectedTab: $landingPageVMData.selectedTab)
                }
                Section(header: Text("Others")) {
                    //                    HStack {
                    //                        Image(systemName: "person.2.fill")
                    //                            .foregroundColor(.blue)
                    //                        Text("Explore")
                    //                    }
                    SideBarTab(image: "person.2.fill", title: "Explore", selectedTab: $landingPageVMData.selectedTab)
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
            switch landingPageVMData.selectedTab {
            case "My Notes": Text("Test")
            case "Explore": Text("Personal")
            case "Bots": Text("Bots")
            case "Edit": Text("Edit")
            case "Settings": Text("Settings")
            default: Text("")
            }
        }
        .environmentObject(landingPageVMData)
        
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {}, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 17))
                })
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
            .preferredColorScheme(.light)
    }
}
