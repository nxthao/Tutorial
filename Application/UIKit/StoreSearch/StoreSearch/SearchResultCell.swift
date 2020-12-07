//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Thao Nguyen on 06/12/2020.
//

import UIKit

class SearchResultCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Outlet variable
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var artistNameLabel : UILabel!
    @IBOutlet weak var artworkImageView : UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
