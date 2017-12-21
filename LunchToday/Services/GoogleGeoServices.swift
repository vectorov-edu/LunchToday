//
//  GoogleGeoServices.swift
//  LunchToday
//
//  Created by Admin on 21.12.17.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import GoogleMaps;

class GoogleGeoServices{
    static let apiKeyMap = "AIzaSyD4Cl3PLyLu0YLsmYlkHBK_yRV0Yfjzblk"
    
    static func GetLocationByAddress(address: String, name: String) -> Promise<CLLocationCoordinate2D> {
        var url = "https://maps.googleapis.com/maps/api/geocode/json?address=\(address) \(name)&key=\(apiKeyMap)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //let ur = URLConvertible.asURL("https://maps.googleapis.com/maps/api/geocode/json?address=\(address) \(name)&key=\(apiKeyMap)")
        return Alamofire.request(url!)
                .responseData()
                .then{ data in
                    return Promise<CLLocationCoordinate2D> { (fulfill,reject) in
                        guard let resp = try? JSONDecoder().decode(AddressResponse.self, from: data) else {
                                        reject(NSError.cancelledError())
                                        return }
                        if let respLocation = resp.results![0].geometry!.location {
                        let result = CLLocationCoordinate2D(latitude: respLocation.lat!, longitude: respLocation.lng!)
                        fulfill(result)
                        }
                    }
            }.catch{error in
            print(error)
        
    }
    }
}
