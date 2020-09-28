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
    
    var currentValue = 50
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
        randomCurrentTargetValue()
        slider.value = Float(currentValue)
        updateLabels()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func randomCurrentTargetValue(){
        targetValue = Int.random(in: 0...100)
        currentValue = Int.random(in: 0...100)
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func totalScore(){
        let difference = abs(targetValue - currentValue)
        score = score - difference
    }
    
    func alertAction(){
        totalScore()
        round += 1
        startNewRound()
    }
    
    @IBAction func showAlert(){
        let message = "The point: \(score)\n" +
                      "The value of slider: \(currentValue)"
        let alert = UIAlertController(title: "Hello Thao Nguyen", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        alertAction()
    }
    
    @IBAction func sliderMoved(_ slider : UISlider){
        currentValue = lroundf(slider.value)
        print("The value of slider is \(slider.value)")
    }

}

