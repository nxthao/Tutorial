//
//  LocationCell.swift
//  MyMap
//
//  Created by Thao Nguyen on 11/18/20.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var decriptionLabel : UILabel!
    @IBOutlet weak var addressLabel : UILabel!
    @IBOutlet weak var photoImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        let selection = UIView(frame: CGRect.zero)
        selection.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        selectedBackgroundView = selection
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK:- Helper
    func configure(for location : Location){
        if location.locationDescription.isEmpty{
            decriptionLabel.text = "No description"
        }
        else{
            decriptionLabel.text = location.locationDescription
        }
        
        if let placeMark = location.placemark{
            var text = ""
            text.add(text: placeMark.subThoroughfare)
            text.add(text: placeMark.thoroughfare, separatedBy: " ")
            text.add(text: placeMark.locality, separatedBy: ", ")
            addressLabel.text = text
        }
        else{
            addressLabel.text = String(format: "Lat: %.8f, Log: %.8f", location.latitude, location.longitude)
        }
        photoImageView.image = thumbnail(for: location)
    }
    
    func thumbnail(for location : Location) -> UIImage{
        if location.hasPhoto , let image = location.photoImage{
            return image.resized(withBounds: CGSize(width: 52, height: 52))
        }
        return UIImage(named: "No Photo")!
    }
}
