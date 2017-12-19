//
//  PlaceItemTableViewCell.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import UIKit

class PlaceItemTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let key = "PlaceItemTableCell"
    
    func updateUI(place : VisualPlace) {
        name.text = place.name
        phone.text = place.phones.joined(separator: ",")
        address.text = place.address
        descriptionLabel.text = place.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
