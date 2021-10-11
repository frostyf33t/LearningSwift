//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Mehdi S on 9/15/21.
//

import UIKit
enum Mode{
    case flashCard
    case quiz
}

enum State {
    case question
    case answer
    case score
}
class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mode = .flashCard
    }
    var mode: Mode = .flashCard {
        didSet {
            switch mode{
            case .flashCard:
                setupFlashCards()
            case .quiz:
                setupQuiz()
            }
            
            updateUI()
        }
    }
    var state: State = .question
    @IBOutlet weak var imageView: UIImageView!
    

    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var showAnswerButton: UIButton!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func showAnswer(_ sender: UIButton) {
        state = .answer
        updateUI()
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count {
            currentElementIndex = 0
            if mode == .quiz{
                state = .score
                updateUI()
                return
            }
            
        }
        
        state = .question
        
    
        updateUI()
        
    }
    
    
    @IBOutlet weak var textField: UITextField!
    

    @IBOutlet weak var modeSelector: UISegmentedControl!
    
    
    @IBAction func switchModes(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0{
            mode = .flashCard
        }else{
            mode = .quiz
        }
        
    }
    
    
    
    
    var elementList: [String] = []
    
    var currentElementIndex = 0
    
    func updateFlashCardUI(elementName: String){
        
        modeSelector.selectedSegmentIndex = 0
        showAnswerButton.isHidden = false
        nextButton.isEnabled = true
        nextButton.setTitle("Next Element", for: .normal)
        
        textField.isHidden = true
        textField.resignFirstResponder()
    
        if state == .answer{
            answerLabel.text = elementName
        } else{
        answerLabel.text = "?"
        }
        
        
    }
    
    func setupFlashCards(){
        state = .question
        elementList = fixedElementList
        currentElementIndex = 0
    }
    
    func setupQuiz(){
        state = .question
        elementList = fixedElementList.shuffled()
        currentElementIndex = 0
        answerIsCorrect = false
        correctAnswerCount = 0
    }
    
    let fixedElementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    
    
    
    func updateQuizUI(elementName: String){
        // Text field and keyboard
        textField.isHidden = false
        switch state{
        case .question:
            textField.isEnabled = true
            textField.text = ""
            textField.becomeFirstResponder()
            nextButton.isEnabled = false
        case .answer:
            textField.isEnabled = false
            textField.resignFirstResponder()
            nextButton.isEnabled = true
        case .score:
            textField.isHidden = true
            textField.resignFirstResponder()
            nextButton.isEnabled = false
        }
        
        
        showAnswerButton.isHidden = true
        if currentElementIndex == elementList.count - 1 {
            nextButton.setTitle("Show Score", for: .normal)
        } else{
            nextButton.setTitle("Next Question", for: .normal)
        }
        
        
        
        
        
        modeSelector.selectedSegmentIndex = 1
        
        
        
        // Answer label
        switch state{
        case .question:
            answerLabel.text = ""
        case .answer:
            if answerIsCorrect {
                answerLabel.text = "Correct!"
            }
            else{
                answerLabel.text = "❌\nCorrect Answer: " + elementName
            }
        case .score:
            answerLabel.text = ""
            print("Your score is \(correctAnswerCount) out of \(elementList.count).")
        }
        
        if state == .score{
            displayScoreAlert()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldContents = textField.text!
        if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased(){
            answerIsCorrect = true
            correctAnswerCount += 1
            
        } else {
            answerIsCorrect = false
            
        }
        
        
        state = .answer
        
        updateUI()
        
        return true
    }
    
    func displayScoreAlert(){
        let alert = UIAlertController(title:
            "Quiz Score", message: "Your score \(correctAnswerCount) out of \(elementList.count).", preferredStyle: .alert)
                                      
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:))
        alert.addAction(dismissAction)
        
        present(alert, animated: true, completion: nil)
                                      
                                      
    }
    
    func scoreAlertDismissed(_ action: UIAlertAction){
        mode  = .flashCard
    }

    func updateUI(){
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        switch mode {
        case .flashCard:
            updateFlashCardUI(elementName: elementName)
        case .quiz:
            updateQuizUI(elementName: elementName)
        
        }
    }
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    }


