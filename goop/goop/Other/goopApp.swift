//
//  goopApp.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct goopApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
