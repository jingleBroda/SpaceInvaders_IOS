//
//  ScoreController.swift
//  SpaceInvaders_NOTSPRITE
//
//  Created by Max on 24.03.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit

class ScoreController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayScore=[PlayerScoreData]()
    var userScore=UserDefaults()
    var allScore=0

    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "background")!))
        
        if userScore.object(forKey: "AllScore")==nil
        {
            let zeroScoreCell=PlayerScoreData.init(nickName: "Сейчас павших героев нет.", score: "")
            arrayScore.append(zeroScoreCell)
        }
        else
        {
            allScore=userScore.integer(forKey: "AllScore")
            
            for i in 0..<allScore
            {
                let keyName="Name"+String(i)
                let keyScore="Score"+String(i)
                if let name=userScore.string(forKey:keyName), let score=userScore.string(forKey:keyScore)
                {
                    let demoScore=PlayerScoreData.init(nickName: name, score: score)
                    arrayScore.append(demoScore)
                }
            }
        }
    }
    
    
    //удаление всех рекордов
    @IBAction func deleteAllScoreClick(_ sender: UIButton) {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
        
        let someVC=self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
        show(someVC!, sender: self)
    }
    
    //методы для UITableViewDataSource
    //возвращает число ячеек(сколько их нужно создать)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayScore.count
    }
    
    //создание ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        cell.nickNamePlayer.text=arrayScore[indexPath.row].nickName
        cell.scorePlayer.text=arrayScore[indexPath.row].score
        
        return cell
    }

}
