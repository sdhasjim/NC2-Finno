//
//  SideBarTab.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 26/07/22.
//

import SwiftUI

struct SideBarTab: View {
    
    var image: String
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {withAnimation{selectedTab = title}}, label: {
            HStack {
                Image(systemName: image)
                    .foregroundColor(.blue)
                Text(title)
                    .foregroundColor(.black)
            }
//            .padding()
//            .frame(width: 70)
            .contentShape(Rectangle())
            .background(Color.secondary.opacity(selectedTab == title ? 1 : 0))
//            .cornerRadius(10)
//            .background((selectedTab == title ? Color.gray : Color.white))
        })
        .buttonStyle(PlainButtonStyle())
    }
}
