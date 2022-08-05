//
//  SwiftUIFBApp.swift
//  SwiftUIFB
//
//  Created by VTechnoZ on 28/07/22.
//

import SwiftUI
import FirebaseCore

@main
struct SwiftUIFBApp: App {
    
    @StateObject var contentVM = ContentViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentVM)
        }
    }
}
