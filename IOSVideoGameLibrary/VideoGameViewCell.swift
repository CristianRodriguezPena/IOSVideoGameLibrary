//
//  VideoGameViewCell.swift
//  IOSVideoGameLibrary
//
//  Created by Cristian Rodriguez on 4/19/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class VideoGameViewCell: UITableViewCell {
    @IBOutlet weak var videoGameGenreLabel: UILabel!
    @IBOutlet weak var videoGameNameLabel: UILabel!
    @IBOutlet weak var videoGameStatusLabel: UILabel!
    
    
    func configure(with videoGame: VideoGame) {
        videoGameNameLabel.text = videoGame.name
        videoGameGenreLabel.text = videoGame.genre
        if videoGame.availability {
            videoGameStatusLabel.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
            videoGameStatusLabel.text = "Avaliable"
        } else {
            if videoGame.dueDate! < Date() {
                videoGameStatusLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                videoGameStatusLabel.text = "LATE"
            } else {
                videoGameStatusLabel.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                videoGameStatusLabel.text = "\(videoGame.dueDate!)"
            }
        }
    }
}
