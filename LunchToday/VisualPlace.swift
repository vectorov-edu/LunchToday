//
//  VisualPlace.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation

class VisualPlace {
    var name : String
    var address : String
    var phones : [String]
    var icon : String
    var description : String
    var url : String
    var latitude : Double
    var longitude : Double
    var products : [Product]
    
    init(name: String, address : String, phones : [String], icon : String, description : String, url : String, latitude : Double, longitude : Double, products : [Product]) {
        self.name = name
        self.address = address
        self.phones = phones
        self.icon = icon
        self.description = description
        self.url = url
        self.latitude = latitude
        self.longitude = longitude
        self.products = products
    }
}
