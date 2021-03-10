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
    
    @IBOutlet weak var FireButtonOptionTutor: UIButton!
    @IBOutlet weak var BulletTutor: UIImageView!// картинка снаряда
    
    @IBOutlet weak var RightButtonOptionTutor: UIButton!
    
    @IBOutlet weak var LeftButtonOptionTutor: UIButton!
    @IBOutlet weak var PlayerShipTutor: UIImageView!
    var stepTytor=0 //отслеживание числа нажатий на кнопку (счет слайдой туториала)
    
    var timer:Timer?
    //____________
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "background")!))
        
        LeftButtonOptionTutor.addTarget(self, action: #selector(buttonDownLeft), for: .touchDown)
        LeftButtonOptionTutor.addTarget(self, action: #selector(buttonUpLeft), for: [.touchUpInside, .touchUpOutside])
        RightButtonOptionTutor.addTarget(self, action: #selector(buttonDownRight), for: .touchDown)
        RightButtonOptionTutor.addTarget(self, action: #selector(buttonUpRight), for: [.touchUpInside, .touchUpOutside])
        
    }
    
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
            InfoTutor.text="Корабль оснащен новейшим ракетным арсеналом \"Белый таракан\". Чтобы его использовать, щелкните 1 раз по кнопке FIRE"
            //BulletTutor.alpha=1
            FireButtonOptionTutor.alpha=1
        case 5:
            InfoTutor.text="Перед вами появился корабль противника. Чтобы уничтожить его, достаточно одного попадания ракеты. Если вы пропустите 3 вражеских корабля, игра закончится "
            EnemyTutor.alpha=1
        case 6:
            //InfoTutor.text="Уничтожте корабль противника и потренеруйтесь в управлении кораблем. Как во всем разбретесь,  немедленно доложите в штаб. Удачи!"
            InfoTutor.text="На этом инсруктаж окончен, а теперь заканчивайте симуляцию и доложите в штаб о вашей готовности."
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
    
    //обработка левого рычага (левой кнопки)
    @objc func buttonDownLeft(_ sender: UIButton) {
        singleMoveLeft()
        timer = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(rapidMoveLeft), userInfo: nil, repeats: true)
    }
    
    @objc func buttonUpLeft(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    func singleMoveLeft() {
        if PlayerShipTutor.frame.midX>35{  //PlayerShip.frame.midX>95
            PlayerShipTutor.center=CGPoint(x: PlayerShipTutor.frame.midX-4, y: PlayerShipTutor.frame.midY)
        }
    }
    
    @objc func rapidMoveLeft() {
        if PlayerShipTutor.frame.midX>35 {
            PlayerShipTutor.center=CGPoint(x: PlayerShipTutor.frame.midX-4, y: PlayerShipTutor.frame.midY)
        }
    }
    //
    //
    //обработка правого рычага (правой кнопки)
    @objc func buttonDownRight(_ sender: UIButton) {
        singleMoveRight()
        timer = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(rapidMoveRight), userInfo: nil, repeats: true)
    }
    
    @objc func buttonUpRight(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    func singleMoveRight() {
        if PlayerShipTutor.frame.midX<self.view.frame.size.width-35 { //<319
            PlayerShipTutor.center=CGPoint(x: PlayerShipTutor.frame.midX+4, y: PlayerShipTutor.frame.midY)
        }
    }
    
    @objc func rapidMoveRight() {
        if PlayerShipTutor.frame.midX<self.view.frame.size.width-35 {
            PlayerShipTutor.center=CGPoint(x: PlayerShipTutor.frame.midX+4, y: PlayerShipTutor.frame.midY)
        }
    }
    //
    
    
}
