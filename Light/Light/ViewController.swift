//
//  ViewController.swift
//  Light
//
//  Created by Mehdi S on 9/20/21.
//

import UIKit

class ViewController: UIViewController {

    var lightOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

   
    
    fileprivate func updateUI() {
        if lightOn {
            view.backgroundColor = .white
            
        }
        else {
            view.backgroundColor = .black
        }
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}

