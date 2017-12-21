//
//  AddressModels.swift
//  LunchToday
//
//  Created by Admin on 21.12.17.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation

public class AddressResponse : Decodable {
    var results : [Result]?
    var status : String?
}

public class AddressComponent : Decodable {
    var long_name : String?
    var short_name : String?
    var types : [String]?
}

public class Location : Decodable {
    var lat : Double?
    var lng : Double?
}

public class Northeast : Decodable {
    var lat : Double?
    var lng : Double?
}

public class Southwest : Decodable {
    var lat : Double?
    var lng : Double?
}

public class Viewport : Decodable {
    var northeast : Northeast
    var southwest : Southwest
}

public class Geometry : Decodable {
    var location : Location?
    var location_type : String?
    var viewport : Viewport?
}

public class Result : Decodable {
    var address_components : [AddressComponent]?
    var formatted_address : String?
    var geometry : Geometry?
    var place_id : String?
    var types : [String]?
}
