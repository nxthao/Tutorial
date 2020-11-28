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
            if let s = placeMark.subThoroughfare{
                text += s + " "
            }
            if let s = placeMark.thoroughfare{
                text += s + ", "
            }
            if let s = placeMark.locality{
                text += s
            }
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
        return UIImage()
    }
}
