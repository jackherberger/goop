//
//  LoginViewViewModel.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errMessage = ""

    init() {}
        
    func login() {
        guard validate() else {
            return
        }
        
        // Try to log user in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errMessage = "Please fill in all fields."
            return false
        }
//         email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errMessage = "Please enter a valid email."
            return false
        }
        return true
    }
}
