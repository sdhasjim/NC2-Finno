//
//  SideBarSection.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 26/07/22.
//

import SwiftUI

struct SideBarSection: View {
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.gray)
                .font(.system(size: 12).weight(.semibold))
        }

    }
}
