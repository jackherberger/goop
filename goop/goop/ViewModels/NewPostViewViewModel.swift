//
//  NewPostViewViewModel.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewPostViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var subTitle = ""
    @Published var dueDate = Date()
    @Published var anon = false
    @Published var text = ""
    @Published var showAlert = false

    init() {}
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        
        return true
    }
    
    func save() {
        guard canSave else {
            return
        }
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create a model for our data
        let newId = UUID().uuidString
        let newItem = postItem(id: newId,
                               title: title,
                               subTitle: subTitle,
                               postDate: Date().timeIntervalSince1970,
                               anon: anon,
                               text: text,
                               isDone: false)
        
        
        // Save the model to the database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("posts")
            .document(newId) 
            .setData(newItem.asDictionary())
        

    }
    
}
