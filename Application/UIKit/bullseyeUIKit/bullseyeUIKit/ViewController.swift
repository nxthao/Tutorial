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
    // The initilized score is 100
    var score = 100
    var round = 1
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    
    // Methods
    // =======
    
    // We need to random number before update label so that label of target value is updated
    func startNewRound(){
        round += 1
        score += pointForCurrentRound()
        randomSlidertTargetValue()
        updateLabels()
    }
    
    func startNewGame(){
        round = 1
        score = 100
        randomSlidertTargetValue()
        updateLabels()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighligted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighligted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackRightResizeable, for: .normal)
    }
    
    func randomSlidertTargetValue(){
        targetValue = Int.random(in: 0...100)
        slider.value = Float.random(in: 0...100)
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func difTargetCurrentValue() -> Int{
        return abs(targetValue - currentValue)
    }
    func pointForCurrentRound() -> Int{
        var point = 0
        if difTargetCurrentValue() == 0{
            point = 100
        }
        else if difTargetCurrentValue() == 1{
            point = 50
        }
        else{
            point = -difTargetCurrentValue()
        }
        return point
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
    
    @IBAction func startOver(){
        startNewGame()
    }

}

