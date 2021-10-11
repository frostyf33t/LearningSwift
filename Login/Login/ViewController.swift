//
//  ViewController.swift
//  Login
//
//  Created by Mehdi S on 10/2/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var Username: UITextField!
    
    @IBOutlet var Password: UITextField!
    
    @IBOutlet var forgotUsernameButton: UIButton!
    
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = Username.text
    }
    
    @IBAction func forgotUsername(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsername", sender: forgotUsernameButton)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenPassword", sender: forgotPasswordButton)
    }
    
}

