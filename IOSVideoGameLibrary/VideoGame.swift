//
//  VideoGame.swift
//  IOSVideoGameLibrary
//
//  Created by Cristian Rodriguez on 4/18/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class VideoGame: Object {
    dynamic var name: String = ""
    dynamic var genre: String = ""
    
    dynamic var dueDate: Date? = nil
    dynamic var availability: Bool {
        return dueDate == nil
    }
    
    convenience init(name: String, genre: String) {
        self.init()
        self.name = name
        self.genre = genre
    }
}
