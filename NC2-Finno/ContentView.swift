//
//  ContentView.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 25/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ListView()
            
            MainView()
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct ListView: View {
    var body: some View {
        Text("List")
    }
}

struct MainView: View {
    var body: some View {
        Text("Main")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
