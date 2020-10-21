//
//  LocationDetailsViewController.swift
//  MyMap
//
//  Created by Thao Nguyen on 10/21/20.
//

import UIKit

class LocationDetailsViewController : UIViewController{
    // Outet variable
    @IBOutlet weak var descriptionTextView : UILabel!
    @IBOutlet weak var categoryLabel : UILabel!
    @IBOutlet weak var latitudeLabel : UILabel!
    @IBOutlet weak var longitudeLabel : UILabel!
    @IBOutlet weak var addressLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    
    // MARK:- Actions
    @IBAction func done(){
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
    }
}
