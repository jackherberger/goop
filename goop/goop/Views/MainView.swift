//
//  ContentView.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.curentUserId.isEmpty {
            // signed in state
            FeedView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
