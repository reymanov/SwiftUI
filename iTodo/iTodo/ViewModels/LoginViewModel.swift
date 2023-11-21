//
//  LoginViewModel.swift
//  ITodo
//
//  Created by Kuba Rejmann on 27/09/2023.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init(){}
    
    func login() {
        guard validate() else {
            return
        }
            
        // Login attempt
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool {
        error = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            error = "Please enter valid email address"
            return false
        }
        
        return true
    }
}
