//
//  ViewController.swift
//  bullseye
//
//  Created by Thao Nguyen on 9/22/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showAlert(){
        let alert = UIAlertController(title: "Hello everyone", message: "This button is pushed", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

