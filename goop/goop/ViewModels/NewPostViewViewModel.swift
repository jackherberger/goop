//
//  NewPostViewViewModel.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import Foundation
class NewPostViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var subTitle = ""
    @Published var dueDate = Date()
    @Published var anon = false
    @Published var text = ""
    init() {}
    
    func save() {
        
    }
    
}
