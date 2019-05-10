//
//  Category.swift
//  Artable
//
//  Created by Jay Raval on 4/25/19.
//  Copyright © 2019 Jay Raval. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category {
    var name: String
    var id: String
    var imageURL: String
    var isActive: Bool = true
    var timeStamp: Timestamp
    
    init(name: String, id: String, imageURL: String, isActive: Bool = true, timeStamp: Timestamp) {
        self.name = name
        self.id = id
        self.imageURL = imageURL
        self.isActive = isActive
        self.timeStamp = timeStamp
    }
    
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.imageURL = data["imageURL"] as? String ?? ""
        self.isActive = data["isActive"] as? Bool ?? true
        self.timeStamp = data["timeStamp"] as? Timestamp ?? Timestamp()
    }
    
    static func modelToData(category: Category) -> [String: Any] {
        let data: [String: Any] = [
            "name": category.name,
            "id": category.id,
            "imageURL": category.imageURL,
            "isActive": category.isActive,
            "timeStamp": category.timeStamp
        ]
        
        return data
    }
}
