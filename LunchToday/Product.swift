//
//  Product.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation

class Product : Decodable {
    var name : String?
    var categoryName : String?
    var categoryId : Int?
    var photoUrl : String?
    var price : Double?
    
    init(name: String, category: String, category id : Int, photoUrl : String, price : Double) {
        self.name = name
        self.categoryName = category
        self.categoryId = id
        self.photoUrl = photoUrl
        self.price = price
    }
}
