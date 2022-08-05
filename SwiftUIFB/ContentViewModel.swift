//
//  ContentViewModel.swift
//  SwiftUIFB
//
//  Created by VTechnoZ on 28/07/22.
//

import SwiftUI
import FirebaseAuth


class ContentViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var userSession: FirebaseAuth.User?
    
    
    init() {
        userSession = auth.currentUser
    }
    
    
    @MainActor
    func createUser(withEmail email: String, password: String) async {
        do {
            let authDataResult = try await auth.createUser(withEmail: email, password: password)
            userSession = authDataResult.user
            print("Debug: User created successfully")
        } catch {
            print("Debug: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    
    @MainActor
    func signIn(withEmail email: String, password: String) async {
        do {
            let authDataResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authDataResult.user
            print("Debug: User signed in successfully")
        } catch {
            print("Debug: Failed to signing in user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signout() {
        do {
            try auth.signOut()
            userSession = nil
            print("Debug: User signed out successfully")
        } catch {
            print("Debug: Failed to signing out user with error \(error.localizedDescription)")
        }
    }
}
