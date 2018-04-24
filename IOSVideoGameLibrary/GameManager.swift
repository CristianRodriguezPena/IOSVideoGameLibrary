//
//  GameManager.swift
//  IOSVideoGameLibrary
//
//  Created by Cristian Rodriguez on 4/19/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation
import RealmSwift

final class GameManager {
    static let sharedInstance = GameManager()
    
    let realm = try! Realm()
    let calendar = Calendar.current
    var games: Results<VideoGame>!
    
    private init() {
        games = realm.objects(VideoGame.self)
    }
    
    func create(_ game: VideoGame) {
        do {
            try realm.write {
                realm.add(game)
            }
        } catch {
            print(error)
        }
        
    }
    
    func delete(_ game: VideoGame) {
        do {
            try realm.write {
                realm.delete(game)
            }
        } catch  {
            print(error)
        }
    }
    
    func getGame(_ index: Int) -> VideoGame {
        return games[index]
    }
    
    func getGameCount() -> Int {
        return games.count
    }
    
    func checkInOrOut(game: VideoGame) {
        try! realm.write {
            if game.availability {
                game.dueDate = calendar.date(byAdding: .day, value: 3, to: Date())!
            } else {
                game.dueDate = nil
            }
        }
    }

}
