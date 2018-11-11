//
//  ViewController.swift
//  PiedraPapelTijeras
//
//  Created by Carlos Santiago Cruz on 11/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var enemyLabel: UILabel!
    @IBOutlet weak var switchModePlayer: UISwitch!
    @IBOutlet weak var stoneButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeScreen()
    }
    
    func initializeScreen() {
        initializeEnemyLabel()
        initializeLabelStatus()
        initializeSwitchModePlayer()
        initializeStartButton()
        initializeStoneButton()
        initializePaperButton()
        initializeScissorButton()
        initializeResetButton()
    }
    func initializeEnemyLabel(){
        enemyLabel.text = "📱"
    }
    func initializeLabelStatus(){
        labelStatus.text = "lets play!, touch Start"
        labelStatus.textAlignment = NSTextAlignment.center
        labelStatus.layer.cornerRadius = 15
    }
    func initializeSwitchModePlayer(){}
    func initializeStartButton(){
        startButton.layer.cornerRadius = 15

    }
    func initializeStoneButton(){
        stoneButton.isEnabled = false
        stoneButton.layer.cornerRadius = 15
        self.stoneButton.backgroundColor = UIColor.gray
    }
    func initializePaperButton(){
        paperButton.isEnabled = false
        paperButton.layer.cornerRadius = 15
        self.paperButton.backgroundColor = UIColor.gray
    }
    func initializeScissorButton(){
        scissorButton.isEnabled = false
        scissorButton.layer.cornerRadius = 15
        self.scissorButton.backgroundColor = UIColor.gray
    }
    func initializeResetButton(){
        resetButton.layer.cornerRadius = 15

    }
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    func getIphoneRandomChoice() -> String {
        let option = [ "👊", "👋", "✌️" ]
        let index = randomInt(min: 0, max: 2)
        return option[index]
    }

    
    func allButtonsDisable(){
        stoneButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        self.stoneButton.backgroundColor = UIColor.gray
        self.paperButton.backgroundColor = UIColor.gray
        self.scissorButton.backgroundColor = UIColor.gray
    }
    func initializeAllGameButtons(){
        initializeScissorButton()
        initializePaperButton()
        initializeStoneButton()
    }
    func allButtonsEnable(){
        stoneButton.isEnabled = true
        paperButton.isEnabled = true
        scissorButton.isEnabled = true
        self.stoneButton.backgroundColor = UIColor.blue
        self.paperButton.backgroundColor = UIColor.blue
        self.scissorButton.backgroundColor = UIColor.blue
    }
  
    @IBAction func startButtonTouched(_ sender: Any) {
        
        allButtonsEnable()
        if switchModePlayer.isOn {
            counter = 0
        }
        else {
            labelStatus.textAlignment = NSTextAlignment.center
            enemyLabel.text = "📱"
        }
        
    }
    @IBAction func switchModePlayerActivated(_ sender: Any) {
        allButtonsDisable()
        initializeAllGameButtons()
        
        if switchModePlayer.isOn    {
            labelStatus.text = "Empiezas tu!!"
            enemyLabel.text = "🙋‍♂️"
            allButtonsDisable()
            counter = 0
        }
        else                        {
            labelStatus.text = "Me vs Iphone, choose a weapon"
            enemyLabel.text = "📱"}
    }
    
    
    @IBAction func stoneButtonTouched(_ sender: Any) {
        if switchModePlayer.isOn {
            while (counter < 2) {
                counter -= 1
                labelStatus.text = "testing counter: \(counter)"
            }
        }
        else {
            enemyLabel.text = "📱"
            switch getIphoneRandomChoice() {
                case "👊":
                labelStatus.text = "DRAW"
                enemyLabel.text = "👊"
                case "👋":
                labelStatus.text = "YOU LOOSE"
                enemyLabel.text = "👋"
                case "✌️":
                labelStatus.text = "YOU WIN"
                enemyLabel.text = "✌️"
                
                default:
                print("")
            
            }
            }
        }
    
    @IBAction func paperButtonTouched(_ sender: Any) {
        if switchModePlayer.isOn {
            while (counter < 2) {
                counter -= 1
                labelStatus.text = "testing counter: \(counter)"
            }
        }
        else {
            switch getIphoneRandomChoice() {
            case "👊":
                labelStatus.text = "YOU WIN"
                enemyLabel.text = "👊"
            case "👋":
                labelStatus.text = "DRAW"
                enemyLabel.text = "👋"
            case "✌️":
                labelStatus.text = "YOU LOOSE"
                enemyLabel.text = "✌️"
            default:
                print("")
            }
        }
    }
    @IBAction func scissorButtonTouched(_ sender: Any) {
        if switchModePlayer.isOn {
            while (counter < 2) {
                counter -= 1
                labelStatus.text = "testing counter: \(counter)"
            }
        }
        else {
            switch getIphoneRandomChoice() {
            case "👊":
                labelStatus.text = "YOU LOOSE"
                enemyLabel.text = "👊"
            case "👋":
                labelStatus.text = "YOU WIN"
                enemyLabel.text = "👋"
            case "✌️":
                labelStatus.text = "DRAW"
                enemyLabel.text = "✌️"
            default:
                print("")
            }
        }
    }
    @IBAction func resetButtonTouched(_ sender: Any) {
        initializeScreen()
        switchModePlayer.isOn = false
        counter = 0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

