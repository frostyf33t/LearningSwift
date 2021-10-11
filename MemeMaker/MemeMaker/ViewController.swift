//
//  ViewController.swift
//  MemeMaker
//
//  Created by Mehdi S on 9/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        topSegmentedControl.removeAllSegments()
        
        for choice in topChoices{
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
            
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        topCaptionLabel.text = topChoices[0].caption
        
        bottomSegmentedControl.removeAllSegments()
        for option in bottomChoices{
            bottomSegmentedControl.insertSegment(withTitle: option.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        bottomCaptionLabel.text = bottomChoices[0].caption
        
        func segmentedControl(sender: UISegmentedControl){
            
        }
        
        
    }
        
        
        
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        let topChoiceBySegmented = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topChoiceBySegmented].caption
            
        let bottomChoiceBySegmented = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomChoiceBySegmented].caption
            
    }
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!

    @IBOutlet weak var topCaptionLabel: UILabel!
    
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    var topChoices: [CaptionOption] = [firstOptionTop, secondOptionTop, thirdOptionTop]
    var bottomChoices: [CaptionOption] = [firstOptionBottom, secondOptionBottom, thirdOptionBottom]
    
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}

