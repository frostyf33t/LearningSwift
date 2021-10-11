//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Mehdi S on 10/4/21.
//

import UIKit

class MiddleViewController: UIViewController {

    
    
    
    
    @IBOutlet var MiddleViewLabel: UILabel!
    
    
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addEvent(from: "viewWillAppear")
        print("MiddleViewController-View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "viewDidAppear")
        print("MiddleViewController-View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "viewWillDisappear")
        print("MiddleViewController-View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "viewDidDisappear")
        print("MiddleViewController-View Did Disappear")
    }
    
    
    func addEvent (from: String){
        if let existingText = MiddleViewLabel.text {
            MiddleViewLabel.text = "\(existingText) \n EventNumber \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
