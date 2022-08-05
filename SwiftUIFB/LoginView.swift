//
//  LoginView.swift
//  SwiftUIFB
//
//  Created by VTechnoZ on 28/07/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var isShowingRegistrationView = false
    
    @EnvironmentObject var contentVM: ContentViewModel
    
    var body: some View {
        ZStack  {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Login Now")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("Please login to continue using our app")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.vertical, 60)
                
                VStack(spacing: 20) {
                    TextField("Enter Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .modifier(CustomTextField())
                    
                    SecureField("Enter Password", text: $password)
                        .modifier(CustomTextField())
                }
                .padding(.horizontal)
                .padding(.top, 60)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Button {
                        Task {
                            await contentVM.signIn(withEmail: email, password: password)
                        }
                    } label: {
                        Text("sign in")

                    }
                    .buttonStyle(CustomButton())
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Button {
                            isShowingRegistrationView = true
                        } label: {
                            Text("sign up")
                                .font(.subheadline.bold())
                                .foregroundColor(.red.opacity(0.7))
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .sheet(isPresented: $isShowingRegistrationView) {
            RegistrationView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
