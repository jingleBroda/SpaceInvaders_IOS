//
//  TutorModel.swift
//  SpaceInvaders_NOTSPRITE
//
//  Created by Max on 23.03.2021.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation
struct TextTutor {
    var TextTutorStep1="Капитан, вы находитесь в учебной симуляции. В этом режиме вы изучите основные механики, которые вам могут пригодиться."
    var TextTutorStep2="Внизу вы можете наблюдать ваш корабль."
    var TextTutorStep3="По бокам, находятся рычаги управления левым и правым двигателями."
    var TextTutorStep4="Корабль оснащен новейшим ракетным арсеналом \"Белый таракан\". Чтобы его использовать, щелкните 1 раз по кнопке FIRE"
    var TextTutorStep5="Перед вами появился корабль противника. Чтобы уничтожить его, достаточно одного попадания ракеты. Если вы пропустите 3 вражеских корабля, игра закончится "
    var TextTutorStep6="На этом инсруктаж окончен, а теперь заканчивайте симуляцию и доложите в штаб о вашей готовности."
}


/*
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
 */
