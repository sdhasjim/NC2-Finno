//
//  LandingPageViewModel.swift
//  NC2-Finno
//
//  Created by Samuel Dennis on 26/07/22.
//

import SwiftUI

class LandingPageViewModel: ObservableObject {
    
    @Published var selectedTab = "My Notes"
    
    @Published var search = ""
}
