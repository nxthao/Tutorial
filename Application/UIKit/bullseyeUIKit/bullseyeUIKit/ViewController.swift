//
//  ViewController.swift
//  bullseyeUIKit
//
//  Created by Thao Nguyen on 9/24/20.
//

import UIKit

class ViewController: UIViewController {

    // Properties
    // ==========
    
    var currentValue = 0
    var targetValue = 0
    var score = 100
    var round = 1
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    
    // Methods
    // =======
    
    func startNewRound(){
        round += 1
        updateLabels()
        randomCurrentTargetValue()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        randomCurrentTargetValue()
    }
    
    func randomCurrentTargetValue(){
        print("random")
        targetValue = Int.random(in: 0...100)
        targetLabel.text = String(targetValue)
        slider.value = Float.random(in: 0...100)
    }
    
    func updateLabels(){
        scoreLabel.text = String(totalScore())
        roundLabel.text = String(round)
    }
    
    func difTargetCurrentValue() -> Int{
        return abs(targetValue - currentValue)
    }
    func totalScore() -> Int{
        if difTargetCurrentValue() == 0{
            score += 100
        }
        else if difTargetCurrentValue() == 1{
            score += 50
        }
        else{
            score = score - difTargetCurrentValue()
        }
        return score
    }
    
    func titleAlert() -> String{
        let title : String
        if difTargetCurrentValue() == 0{
            title = "Perfect!"
        }
        else if difTargetCurrentValue() < 5{
            title = "You almost have it!"
        }
        else if difTargetCurrentValue() < 10{
            title = "Pretty good!"
        }
        else{
            title = "It is not bad! Do you try more?"
        }
        return title
    }
    
    @IBAction func showAlert(){
        let message = "The value of slider: \(currentValue)"
        let alert = UIAlertController(title: titleAlert(), message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {_ in self.startNewRound()})
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider : UISlider){
        currentValue = lroundf(slider.value)
        print("The value of slider is \(slider.value)")
    }

}

