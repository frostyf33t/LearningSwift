//
//  ViewController.swift
//  CommonInputControls2
//
//  Created by Mehdi S on 9/27/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var toggle: UISwitch!
    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var button: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @IBAction func respondToTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was tapped!")
        
        if toggle.isOn{
            print("The switch is on")
        }
        else{
            print("The switch is off")
        }
        
        print("The slider value is currently \(slider.value)")
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn{
            print("The switch is on!")
        }
        else{
            print("The switch is off!")
        }
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func returnKeyTapped(_ sender: UITextField) {
        
        if let text = sender.text{
            print(text)
        }
    }
    
    
    @IBAction func textChanged(_ sender: UITextField) {
        
        if let text = sender.text{
            print(text)
        }
    }
    
    
    
}

