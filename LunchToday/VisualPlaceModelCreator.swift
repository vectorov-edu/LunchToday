//
//  VisualModelCreator.swift
//  LunchToday
//
//  Created by Admin on 21.12.17.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation

class VisualPlaceModelCreator {
    func GetPlaces(posterUsers : [PosterUser]) -> [VisualPlace] {
        var list = [VisualPlace]()
        for user in posterUsers{
            if let places = user.places {
                for place in places {
                    list.append(VisualPlace(name: place.name!, address: place.address!, phones: place.phones!, icon: user.icon!, description: place.description, products: user.products))
                }
            }
//            list += user.places.map{(place) in return VisualPlace(name: place.name, address: place.address, phones: place.phones, icon: place.icon, description: place.description, url: place.url, latitude: place.latitude, longitude: place.longitude, products: place.products)}
        }
        return list
    }
}
