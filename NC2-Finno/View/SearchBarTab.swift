//
//  SearchBarTab.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 29/07/22.
//

import SwiftUI

struct SearchBarTab: View {
    
    
    var image: String
    var title: String
    @Binding var selectedTab: String
    @Binding var search: String
    
    var body: some View {
        Button(action: {withAnimation{selectedTab = title}}, label: {
            HStack {
                HStack {
                    Image(systemName: image)
                        .foregroundColor(.gray)
                    TextField(title, text: $search)
                        .textFieldStyle(PlainTextFieldStyle())
                }
            }
//            .padding()
//            .frame(width: 70)
            .contentShape(Rectangle())
            .background(Color.secondary.opacity(selectedTab == title ? 0.20 : 0))
//            .cornerRadius(10)
//            .background((selectedTab == title ? Color.gray : Color.white))
        })
        .buttonStyle(PlainButtonStyle())

    }
}
