//
//  ViewController.swift
//  SpaceInvaders_NOTSPRITE
//
//  Created by Max on 02.03.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import UIKit

class TutorViewController:ViewController {
    //_________var________
    @IBOutlet weak var NextStepTutorOption: UIButton! //свойства кнопки понимания
    @IBOutlet weak var InfoTutor: UILabel!//лейбл с инфой геймплея в туториале
    @IBOutlet weak var EnemyTutor: UIImageView!//корабль противника(антигерой)
    @IBOutlet weak var RightButtonOptionTutor: UIButton!// свойства правой кнопки
    @IBOutlet weak var LeftButtonOptionTutor: UIButton!// свойства левой кнопки
    @IBOutlet weak var BulletTutor: UIImageView!// картинка снаряда
    @IBOutlet weak var PlayerShipTutor: UIImageView!// корабль игрока
    var stepTytor=0 //отслеживание числа нажатий на кнопку (счет слайдой туториала)
    //____________
    
    @IBAction func NextStepTutor(_ sender: UIButton)//обработка нажатия кнопки понимания (понимаю....)
    {
        stepTytor=stepTytor+1
        NextStepTutorOption.setTitle("Понятно", for: .normal)
        switch stepTytor {
        case 1:
            InfoTutor.alpha=1
            InfoTutor.text="Капитан, вы находитесь в учебной симуляции. В этом режиме вы изучите основные механики, которые вам могут пригодиться."
        case 2:
            InfoTutor.text="Внизу вы можете наблюдать ваш корабль."
            PlayerShipTutor.alpha=1
        case 3:
            InfoTutor.text="По бокам, находятся рычаги управления левым и правым двигателями."
            LeftButtonOptionTutor.alpha=1
            RightButtonOptionTutor.alpha=1
        case 4:
            InfoTutor.text="Корабль оснащен новейшим ракетным арсеналом \"Белый таракан\". Чтобы его использовать, щелкните 1 раз по экрану вашего девайса."
            BulletTutor.alpha=1
        case 5:
            InfoTutor.text="Перед вами появился корабль противника. Чтобы уничтожить его, достаточно одного попадания ракеты."
            EnemyTutor.alpha=1
        case 6:
            InfoTutor.text="Уничтожте корабль противника и потренеруйтесь в управлении кораблем. Как во всем разбретесь,  немедленно доложите в штаб. Удачи!"
        case 7:
            InfoTutor.text=""
            NextStepTutorOption.setTitle("Закончить обучение", for: .normal)
        default:
            stepTytor=0
            NextStepTutorOption.setTitle("Начать обучение", for: .normal)
            let someVC=self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
            show(someVC!, sender: self)
        }
        
    }
    
    
}
