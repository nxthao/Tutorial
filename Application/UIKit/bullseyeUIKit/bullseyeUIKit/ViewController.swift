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
    
    @IBOutlet weak var slider : UISlider!
    
    // Methods
    // =======
    
    func startNewRound(){
        targetValue = Int.random(in: 0...100)
        currentValue = Int.random(in: 0...100)
        slider.value = Float(currentValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
//        currentValue = lroundf(slider.value)
//        targetValue = Int.random(in: 0...100)
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        let message = "The value of slider is \(currentValue)"
        let alert = UIAlertController(title: "Hello Thao Nguyen", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider : UISlider){
        currentValue = lroundf(slider.value)
        print("The value of slider is \(slider.value)")
    }

}

