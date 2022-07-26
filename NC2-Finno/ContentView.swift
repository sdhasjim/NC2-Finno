//
//  ContentView.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 25/07/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var landingPageVMData = LandingPageViewModel()
    
    var body: some View {
        LandingPage()
//        NavigationView {
//            List {
//                Section(header: Text("Notes")) {
////                    TextField("Search", text: $landingPageVMData.search)
//                    HStack {
//                        Image(systemName: "note.text")
//                            .foregroundColor(.blue)
//                        Text("My Notes")
//                    }
//                    .searchable(text: $landingPageVMData.search)
//                }
//                Section(header: Text("Others")) {
//                    HStack {
//                        Image(systemName: "person.2.fill")
//                            .foregroundColor(.blue)
//                        Text("Explore")
//                    }
//                }
//
//                Spacer()
//
//                Section(header: Text("Tags")) {
//                    HStack {
//                        Image(systemName: "circle.fill")
//                            .font(.system(size: 8))
//                            .foregroundColor(.blue)
//                        Text("Blue")
//                    }
//                    HStack {
//                        Image(systemName: "circle.fill")
//                            .font(.system(size: 8))
//                            .foregroundColor(.red)
//                        Text("Red")
//                    }
//                }
//
//                Spacer()
//
//            }
//            .searchable(text: $landingPageVMData.search)
//        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
