//
//  MainViewViewModel.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var curentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.curentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
