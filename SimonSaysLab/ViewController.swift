//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
//@IBAction func dieButtonTapped(sender: AnyObject) {
//let diceRoll = randomDiceRoll()
//switch diceRoll {
//case 1:

//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!

    
    var simonSaysGame = SimonSays()
    var buttonsClicked = 0
    
    @IBAction func redButtonTapped(sender: AnyObject) {
        simonSaysGame.guessRed()
        print("Red button tapped")
        buttonsClicked += 1
        updateWinLabel()
    }
    
    @IBAction func greenButtonTapped(sender: AnyObject) {
        simonSaysGame.guessGreen()
        print("Green button tapped")
        buttonsClicked += 1
        updateWinLabel()
    }
    
    @IBAction func yellowButtonTapped(sender: AnyObject) {
        simonSaysGame.guessYellow()
        print("Yellow button tapped")
        buttonsClicked += 1
        updateWinLabel()
    }
    
    @IBAction func blueButtonTapped(sender: AnyObject) {
        simonSaysGame.guessBlue()
        print("Blue button tapped")
        buttonsClicked += 1
        updateWinLabel()
    }
    
    override func viewDidLoad() {
        winLabel.hidden = true
        
        super.viewDidLoad()
    }
}



// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: .TransitionFlipFromBottom , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        displayTheColors()
    }
    
    private func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: .TransitionCurlUp, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    
    }
    
    func updateWinLabel() {
        if buttonsClicked == 5 && simonSaysGame.wonGame() {
            winLabel.hidden = false
            print("You won!")
            winLabel.text = "You won" }
        
        else if buttonsClicked == 5 && !simonSaysGame.wonGame() {
            winLabel.hidden = false
            print("Nope, try again.")
            winLabel.text = "Nope try again." }
        
        
        
    }
    


}


//
//func updateWinLabel() {
//    switch buttonsClicked == 5 {
//    case simonSaysGame.wonGame():
//        winLabel.hidden = false
//        print("You won!")
//        winLabel.text = "You won"
//        
//    case !simonSaysGame.wonGame():
//        winLabel.hidden = false
//        print("Nope, try again.")
//        winLabel.text = "Nope try again."
//        
//    default:
//        winLabel.hidden = false
//        
//        
//}






