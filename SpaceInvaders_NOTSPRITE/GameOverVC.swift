//
//  GameOverVC.swift
//  SpaceInvaders_NOTSPRITE
//
//  Created by Max on 09.03.2021.
//  Copyright © 2021 Max. All rights reserved.
//
import UIKit
class GameOverVC:ViewController {

    var userScore=UserDefaults()
    var allScore=0
    var demoScore=0
    @IBOutlet weak var namePlayerField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "background")!))
        
        demoScore=userScore.integer(forKey: "DemoScore")
        
        if !(userScore.object(forKey: "AllScore")==nil){
            allScore=userScore.integer(forKey: "AllScore")
        }
       
    }
    
    @IBAction func savePlayer(_ sender: UIButton) {
        let name="Name"+String(allScore)
        let score="Score"+String(allScore)
        userScore.setValue(namePlayerField.text, forKey: name)
        userScore.setValue(demoScore, forKey: score)
        allScore+=1
        userScore.setValue(allScore, forKey: "AllScore")
        
        let someVC=self.storyboard?.instantiateViewController(withIdentifier: "ScoreTable")
        show(someVC!, sender: self)
    }
    
}
