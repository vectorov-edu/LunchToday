//
//  PosterModels.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation

//MARK: PosterPlace
class PosterPlace: Decodable
{
    var number : Int?
    var name : String?
    var address : String?
    var phones : [String]?
    var url : String?
    var description : String?
    
//    init(number: Int, name: String, address : String, phones: [String], url : String, description: String)
//    {
//        self.number = number
//        self.name = name
//        self.address = address
//        self.phones = phones
//        self.url = url
//        self.description = description
//    }
}

//MARK: PosterUser
class PosterUser: Decodable {
    
    var id : String?
    var api_key : String?
    var name : String?
    var icon : String?
    var places : [PosterPlace]?
    var products : [Product]?
    
//    public init(id: String, api_key: String, name: String, icon: String, places: [PosterPlace], products: [Product]){
//        self.id = id
//        self.api_key = api_key
//        self.name = name
//        self.icon = icon
//        self.places = places
//        self.products = products
//    }
}

//MARK: PosterSpot
public class Storage: Decodable {
    
    var storage_id : Int?
    var storage_name : String?
    var storage_adress : String?

//    public init(storage_id: Int, storage_name: String, storage_adress: String){
//        self.storage_id = storage_id;
//        self.storage_name = storage_name;
//        self.storage_adress = storage_adress;
//    }
    
}

class Response: Decodable {

    var spot_id : String?
    var spot_name : String?
    var spot_adress : String?
    var storages: [Storage]?

//    public init(spot_id: String, spot_name: String, spot_adress: String, storages: [Storage]){
//        self.spot_id = spot_id;
//        self.spot_name = spot_name;
//        self.spot_adress = spot_adress;
//        self.storages = storages;
//    }
    
}

class PosterSpot: Decodable {
    
    var response: [Response]

//    public init(response: [Response])
//    {
//        self.response = response;
//    }
}


