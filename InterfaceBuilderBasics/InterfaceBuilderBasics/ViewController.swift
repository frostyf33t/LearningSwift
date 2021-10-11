//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Mehdi S on 9/20/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pressButton.setTitleColor(.blue, for: .normal)
    }

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var pressButton: UIButton!
    
    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = "This app rocks!"
    }
}

