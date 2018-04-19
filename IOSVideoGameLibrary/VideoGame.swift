//
//  VideoGame.swift
//  IOSVideoGameLibrary
//
//  Created by Cristian Rodriguez on 4/18/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation

class VideoGame {
    var name: String
    var genre: Genre
    
    var dueGame: Date? = nil
    var avaliability: Bool {
        return dueGame == nil
    }
    
    enum Genre: String {
        case rpg = "RPG"
        case shooter = "Shooter"
        case platformer = "Platformer"
        case battleRoyale = "Battle Royal"
        case mmorpg = "MMORPG"
        case sandbox = "Sandbox"
        case fighttingGame = "Fighting Game"
        case survival = "Survival Game"
        
    }
    
    init(name: String, genre: Genre) {
        self.name = name
        self.genre = genre
    }
}
