//
//  ProductItemTableViewCell.swift
//  LunchToday
//
//  Created by Admin on 21.12.17.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import UIKit
import Alamofire

class ProductItemTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var price: UILabel!
    
    static let key = "ProductItemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI (product : Product){
        
        if let url = product.photoUrl {
            Alamofire.request(url).responseData()
             .then {[weak self] data in
                self?.productImage.image = UIImage(data: data)
            }
        }
        
        productName.text = product.name
        productCategory.text = product.categoryName
        price.text = product.price?.description
    }
    
}
