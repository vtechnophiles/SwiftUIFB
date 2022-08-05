//
//  ContentView.swift
//  SwiftUIFB
//
//  Created by VTechnoZ on 28/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var contentVM: ContentViewModel
    
    var body: some View {
        Group {
            if contentVM.userSession != nil {
                MainInterfaceView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
