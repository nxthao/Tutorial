//
//  CurrentLocationViewController.swift
//  TNMap
//
//  Created by Thao Nguyen on 03/12/2020.
//

import UIKit

class CurrentLocationViewController: UIViewController {

    // Outlet variable
    @IBOutlet weak var message : UILabel!
    @IBOutlet weak var latitude : UILabel!
    @IBOutlet weak var latitudeValue : UILabel!
    @IBOutlet weak var longitude : UILabel!
    @IBOutlet weak var longitudeValue : UILabel!
    @IBOutlet weak var address : UILabel!
    
    // Action
    @IBAction func getLocation(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

