//
//  MainInterfaceView.swift
//  SwiftUIFB
//
//  Created by VTechnoZ on 28/07/22.
//

import SwiftUI

struct MainInterfaceView: View {
    
    @EnvironmentObject var contentVM: ContentViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        contentVM.signout()
                    } label: {
                        Text("sign out")
                            .padding(10)
                            .foregroundColor(.white)
                            .background(.white.opacity(0.3))
                            .clipShape(Capsule())
                    }
                    .padding()
                }
            
                Spacer()
                
                VStack {
                    Text("Welcome Here")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("Let'g grow together")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.3))
                }
                .padding(.bottom, 60)
                
                Spacer()
                
            }
        }
    }
}

struct MainInterfaceView_Previews: PreviewProvider {
    static var previews: some View {
        MainInterfaceView()
    }
}
