//
//  ViewController.swift
//  Apple Pie
//
//  Created by Mehdi S on 9/29/21.
//
/* There is a bug in the letterButtonPressed function--Build works but when pressing on the key, see message "Unexpectedly found nil while unwrapping optional." Remade all action connections to keyboard but didnt solve problem. Looked up error and saw others had same issue.  Will fix bug at a later time.
*/

import UIKit

var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program", "animal", "spider", "mountain"]

let incorrectMovesAllowed = 7

var totalWins = 0
var totalLosses = 0
class ViewController: UIViewController {
    
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
    
    var currentGame: Game!
    
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI(){
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

}

