//
//  BasicGameFildeVC.swift
//  SpaceInvaders_NOTSPRITE
//
//  Created by Max on 03.03.2021.
//  Copyright © 2021 Max. All rights reserved.
//

//import Foundation
import UIKit

class BasicGameFildeVC: ViewController {
    //________________var_____________________
    @IBOutlet weak var RightButtonOP: UIButton! //свойства правой кнопки
    @IBOutlet weak var LeftButtonOP: UIButton! //свойства левой кнопки
    @IBOutlet weak var PlayerShip: UIImageView! //картинка корабля игрока
    @IBOutlet weak var ScoreLabel: UILabel!
    
    var timer:Timer? //таймер для перемещения корабля игорока
    var Bullettimer:Timer? //таймер для обработки полета снарядов
    var EnemyShipMove:Timer? //таймер движения враж кораблей
    var EnemyShipGenerate:Timer? //таймер для генерации вражеских кораблей
    var GameOver:Timer? //таймер для проверки конца игры
    
    var maSsivBullet:[UIImageView]=[] //массив выпущенных снарядов
    var MassivEnemyShip:[UIImageView]=[] //массив кораблей противника
    var numberBullet=0 //число активных выстрелов (используется как индекс на последний выпущенный снаряд)
    var numberEnemy=0 //число активных вражеских кораблей (используется как индекс на последний выпущенный вражеский корабль)
    
    var t=false //флаг для проверки удаления ракеты
    var t_enemy=false //флаг для проверки выхода враж. кораблей за зону стрельбы
    var statusTimer=false //статус(флаг) таймера: false- выкл. true-вкл
    var EnemyDestroy=false //статус удаления картинки вражеского корабля
    var scoreDiesEnemy=0 //счет убийств противников
    //________________________________________
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "background")!))
        //обработка левой и правой кнопок
        LeftButtonOP.addTarget(self, action: #selector(buttonDownLeft), for: .touchDown)
        LeftButtonOP.addTarget(self, action: #selector(buttonUpLeft), for: [.touchUpInside, .touchUpOutside])
        RightButtonOP.addTarget(self, action: #selector(buttonDownRight), for: .touchDown)
        RightButtonOP.addTarget(self, action: #selector(buttonUpRight), for: [.touchUpInside, .touchUpOutside])
        
        //проверка конца игры
        GameOver = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerGameOver), userInfo: nil, repeats: true)
        //генерация вражеских кораблей
        EnemyShipGenerate = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(EnemyShipDraw), userInfo: nil, repeats: true)
        //движение вражеских кораблей
        EnemyShipMove = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(TimerALLEnemyShipMove), userInfo: nil, repeats: true)
    
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
        if PlayerShip.frame.midX>35{  //PlayerShip.frame.midX>95
            PlayerShip.center=CGPoint(x: PlayerShip.frame.midX-4, y: PlayerShip.frame.midY)
        }
    }
    
    @objc func rapidMoveLeft() {
            if PlayerShip.frame.midX>35 {
                PlayerShip.center=CGPoint(x: PlayerShip.frame.midX-4, y: PlayerShip.frame.midY)
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
        if PlayerShip.frame.midX<self.view.frame.size.width-35 { //<319
            PlayerShip.center=CGPoint(x: PlayerShip.frame.midX+4, y: PlayerShip.frame.midY)
        }
    }
    
    @objc func rapidMoveRight() {
        if PlayerShip.frame.midX<self.view.frame.size.width-35 {
            PlayerShip.center=CGPoint(x: PlayerShip.frame.midX+4, y: PlayerShip.frame.midY)
        }
    }
    //
    // кнопка выпуска ракеты
    @IBAction func FireButton(_ sender: UIButton) {

        // конструкция появления снаряда РАБОТАЕТ!!!!
        let ImageBullet = UIImage(named: "bullet")
        let SingleBullet:UIImageView = UIImageView()
        //let deltaTimer:Timer?
        
        SingleBullet.frame.size.width = 6
        SingleBullet.frame.size.height = 18
        SingleBullet.center = CGPoint(x: PlayerShip.frame.midX, y: PlayerShip.frame.midY-35)
        SingleBullet.image = ImageBullet
        maSsivBullet.append(SingleBullet)
        view.addSubview(maSsivBullet[numberBullet])
        //
        numberBullet=numberBullet+1
        
        
        //конструкция движения ракеты(запуск таймера)
            if !(maSsivBullet.count==0)&&(statusTimer==false){
                statusTimer=true
                Bullettimer = Timer.scheduledTimer(timeInterval: 0.0416, target: self, selector: #selector(TimerALLBullet), userInfo: nil, repeats: true)
        }
    }
    
    //обработка попадания в корабль
    func EnemyDestroy(bull:UIImageView, enemy:UIImageView) {
        if (bull.frame.midX>enemy.frame.midX-16 && bull.frame.midX<enemy.frame.midX+16) && (bull.frame.midY>enemy.frame.midY-16 && bull.frame.midY<enemy.frame.midY+16) {
            
            bull.removeFromSuperview()
            enemy.removeFromSuperview()
            t=true
        }
    }
    
    //движение ракеты
    func SinglemoveBullet(a:UIImageView){
         a.center=CGPoint(x: a.frame.midX, y: a.frame.midY-6)
        
        var i=0;
        while t==false && i<numberEnemy {
            EnemyDestroy(bull:a, enemy:MassivEnemyShip[i])
            i=i+1
        }
        
        if t==false{
            if a.frame.midY<=100 {
                a.removeFromSuperview()
                t=true
            }
        }
        else{
            MassivEnemyShip.remove(at: i-1)
            numberEnemy=numberEnemy-1
            scoreDiesEnemy=scoreDiesEnemy+1
            ScoreLabel.text="Srore:"+String(scoreDiesEnemy)
        }
        
    }
    
    func SingleALLMoveBullet(a:Array<UIImageView>) {
        for i in 0 ..< a.count {
            SinglemoveBullet(a: a[i])
            if t==true {
                maSsivBullet.remove(at: i)
                numberBullet=numberBullet-1
                t=false
                //print("\(maSsivBullet.count) \(numberBullet)")
            }
        }
    }
    
    @objc func TimerALLBullet(){
        SingleALLMoveBullet(a: maSsivBullet)
        if maSsivBullet.count==0{
            Bullettimer?.invalidate()
            Bullettimer=nil
            statusTimer=false
        }
    }
    //
    
    
    //генерация вражеских кораблей
    @objc func EnemyShipDraw() {
        //генерация волны кораблей противников
        let randomeCountEnemyShip=Int.random(in:1...5)
        var randomePositionEnemyShip=0
        var SetEnemyShip:Set<Int>=[]
        var TransformSetToArray:[Int]=[]
        var i=0
        
        while i<randomeCountEnemyShip{
            randomePositionEnemyShip=Int.random(in:1...5)
            if !SetEnemyShip.contains(randomePositionEnemyShip){
                SetEnemyShip.insert(randomePositionEnemyShip)
                i=i+1
            }
        }
        TransformSetToArray=Array(SetEnemyShip).sorted()
        //
        // отображение полученной волны
        var genereteMidXEnemyShip=0
        let rightLimit=Int((self.view.frame.size.width/5)/2) //это для определения ширины экрана
        
        for i in 0..<TransformSetToArray.count{
            switch TransformSetToArray[i]{
                case 1:genereteMidXEnemyShip=rightLimit
                case 2:genereteMidXEnemyShip=rightLimit*3
                case 3:genereteMidXEnemyShip=rightLimit*5
                case 4:genereteMidXEnemyShip=rightLimit*7
                case 5:genereteMidXEnemyShip=rightLimit*9
            default: print("KAVO?")
            }
            
            //let randomSpawnDote = Int.random(in: Int(35)..<Int(rightLimit)) //генерация случайной координаты появления
            
            //формирование массива враж кораблей
            // конструкция появления снаряда РАБОТАЕТ!!!!
            let ImageEnemyShip = UIImage(named: "enemy")
            let SingleEnemy:UIImageView = UIImageView()
            
            SingleEnemy.frame.size.width = 70
            SingleEnemy.frame.size.height = 70
            SingleEnemy.center = CGPoint(x: genereteMidXEnemyShip, y: 100)
            SingleEnemy.image = ImageEnemyShip
            MassivEnemyShip.append(SingleEnemy)
            view.addSubview(MassivEnemyShip[numberEnemy])
        
            numberEnemy=numberEnemy+1
        }
            //if  numberEnemy==15{
            //    EnemyShipGenerate?.invalidate()
            //    EnemyShipGenerate=nil
           // }
            
        
    }
    //
    //движение вражеских кораблей
    func SingleMoveEnemyShip(a:UIImageView){
       a.center=CGPoint(x: a.frame.midX, y: a.frame.midY+2)
        if a.frame.midY>=890 {
            a.removeFromSuperview()
            t_enemy=true
        }
        
    }
    
    func SingleALLMoveEnemyShip(a:Array<UIImageView>) {
        for i in 0 ..< a.count {
            SingleMoveEnemyShip(a: a[i])
            if t_enemy==true {
                MassivEnemyShip.remove(at: i)
                numberEnemy=numberEnemy-1
                t_enemy=false
            }
        }
       
    }
    
    @objc func TimerALLEnemyShipMove(){
        SingleALLMoveEnemyShip(a: MassivEnemyShip)
    }
    //
    //проверка на конец игры
    @objc func TimerGameOver(){
        if scoreDiesEnemy>=15{
            print("GG!")
            //остановка таймера
            timer?.invalidate()
            Bullettimer?.invalidate()
            EnemyShipMove?.invalidate()
            EnemyShipGenerate?.invalidate()
            GameOver?.invalidate()
            //выход в главное меню
            let someVC=self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
            show(someVC!, sender: self)
        }
    }
    
}
