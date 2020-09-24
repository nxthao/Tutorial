//
//  ViewController.swift
//  bullseyeUIKit
//
//  Created by Thao Nguyen on 9/24/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello Thao Nguyen", message: "This is UIKit application", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider : UISlider){
        print("The value of slider is \(slider.value)")
    }

}

