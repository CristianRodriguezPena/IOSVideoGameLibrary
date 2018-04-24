//
//  AddGameViewController.swift
//  IOSVideoGameLibrary
//
//  Created by Cristian Rodriguez on 4/12/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genrePicker: UIPickerView!
    
    let gameManager = GameManager.sharedInstance
    
    let genres = ["RPG","Shooter","Strategy","Platformer","Action RPG", "Battle Royale", "MMORPG", "Sandbox", "Fighting Game", "survival Game"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePicker.delegate = self
        genrePicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    @IBAction func SaveButton(_ sender: Any) {
        if nameTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Incomplete", message: "Please Fill in the Name Box", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            gameManager.create(VideoGame(name: nameTextField.text!, genre: genres[genrePicker.selectedRow(inComponent: 0)]))
            self.performSegue(withIdentifier: "unwindToGameLibrary", sender: self)
        }
    }

}

