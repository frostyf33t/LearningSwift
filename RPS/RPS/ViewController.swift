//
//  ViewController.swift
//  RPS
//
//  Created by Mehdi S on 9/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeStatus(state: .Start)
    }
    
    @IBOutlet weak var AppSign: UILabel!
    
    @IBOutlet weak var GameStatus: UILabel!
    
    @IBOutlet weak var RockOutlet: UIButton!
    
    @IBOutlet weak var PaperOutlet: UIButton!
    
    @IBOutlet weak var ScissorsOutlet: UIButton!
    
    @IBOutlet var PlayOutlet: UIView!
    
    @IBAction func Rock(_ sender: UIButton) {
        let currentSign = randomSign()
        play()
        let yourChoice = Sign.rock
        AppSign.text = presentSign(currentSign)
        let result = yourChoice.comparison(currentSign)
        changeStatus(state: result)
        disableHands()
        PlayAgainOutlet.isHidden = false
    }
    @IBAction func Paper(_ sender: UIButton) {
        let currentSign = randomSign()
        play()
        let yourChoice = Sign.paper
        AppSign.text = presentSign(currentSign)
        let result = yourChoice.comparison(currentSign)
        changeStatus(state: result)
        disableHands()
        PlayAgainOutlet.isHidden = false
    }
    @IBAction func Scissors(_ sender: UIButton) {
        let currentSign = randomSign()
        play()
        let yourChoice = Sign.scissors
        AppSign.text = presentSign(currentSign)
        let result = yourChoice.comparison(currentSign)
        changeStatus(state: result)
        disableHands()
        PlayAgainOutlet.isHidden = false
    }
    @IBAction func PlayAgainButton(_ sender: UIButton) {
        changeStatus(state: .Start)
        
    }

    @IBOutlet weak var PlayAgainOutlet: UIButton!
    
    func disableHands(){
        RockOutlet.isEnabled = false
        PaperOutlet.isEnabled = false
        ScissorsOutlet.isEnabled = false
    }
    
    func enableHands(){
        RockOutlet.isEnabled = true
        PaperOutlet.isEnabled = true
        ScissorsOutlet.isEnabled = true
    }
    
    
    func changeStatus(state: GameState){
        if state == .Start{
            PlayOutlet.backgroundColor = UIColor(red: 0.6, green: 0.9, blue: 0.9,alpha: 0.850)
            AppSign.text = "RPS"
            enableHands()
            PlayAgainOutlet.isHidden = true
            
            GameStatus.text = "🤖"
            
        }
        else if state == .Lose{
            GameStatus.text = "You Lost!"
            PlayOutlet.backgroundColor = UIColor(red: 0.8, green: 0.4, blue: 0.4,alpha: 0.850)
        }
        else if state == .Win{
            PlayOutlet.backgroundColor = UIColor(red: 0.4, green: 0.8, blue: 0.4,alpha: 0.850)
            GameStatus.text = "You Win!"
        }
        else{
            PlayOutlet.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8,alpha: 0.850)
            GameStatus.text = "Its a draw!"
        }
    }
    
    func play(){
        
    
        changeStatus(state: .Start)
    }
    
    func presentSign(_ currentSign: Sign)->String{
        
        if currentSign == .rock{
            return "👊"
        }
        else if currentSign == .paper{
            return "✋"
        }
        else{
            return "✌️"
        }
    }
    
    
}

