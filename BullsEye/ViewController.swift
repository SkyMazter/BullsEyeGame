//
//  ViewController.swift
//  BullsEye
//
//  Created by Oscar Comunidad on 8/30/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var target: UILabel!
    @IBOutlet var score:  UILabel!
    @IBOutlet var round: UILabel!
    
    let secret = "This is a button"
    var currentValue : Int = 0
    var roundNum : Int = 0
    var scoreVal : Int = 0
    var goal : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        currentValue = lroundf(slider.value)
        
        
        score.text = String(scoreVal)
        round.text = String(roundNum)
        
        goal = Int.random(in: 1...100)
        target.text = String(goal)
    }
        
    @IBAction func hitMe(){
        let difference = abs(goal - currentValue)
        let points = 100 - difference
        
        scoreVal += points
        score.text = String(scoreVal)
        
        
        let alert = UIAlertController(
            title: "Ouch",
            message: "The Value of the slider is: " + String(currentValue),
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "Exit",
            style: .default,
            handler: {
                _ in
                self.nextRound()
            }
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
//        roundNum+=1
//        round.text = String(roundNum)
//
//
//
//        goal = Int.random(in: 1...100)
//        target.text = String(goal)
        
    }
    func nextRound(){
        roundNum+=1
        round.text = String(roundNum)

        goal = Int.random(in: 1...100)
        target.text = String(goal)

    }
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func start_over(){
        currentValue = 0
        roundNum = 0
        scoreVal = 0
        goal = Int.random(in: 1...100)
        target.text = String(goal)
        score.text = String(scoreVal)
        round.text = String(roundNum)
        
        let alert = UIAlertController(
            title: "Game Reset",
            message: "Give it another shot!",
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "Okay",
            style: .default,
            handler: nil
        )
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

