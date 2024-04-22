//
//  Post.swift
//  goop
//
//  Created by Jack Herberger on 4/7/24.
//

import Foundation

struct postItem: Codable, Identifiable {
    let id: String
    let title: String
    let subTitle: String
    let postDate: TimeInterval
    let anon: Bool
    let text: String
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
    
    
}
