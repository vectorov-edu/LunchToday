//
//  PosterUsersService.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

enum AppState {
    case mock
    case real
}

public class PosterUsersService{
    static var users : [PosterUser]?

    static let State = AppState.real

//    static func GetPostersUsers1() -> Promise<[PosterUser]> {
//        if let usrs = users {
//            return Promise<[PosterUser]> { (fulfill, _) in fulfill(usrs)}
//        }
//        if State == .mock{
//            return GetUserMock()
//        }
//
////        firstly{
////            GetListClient()
////            }.then{ clients -> (Promise<[PosterSpot]>, Promise<[String]>, Promise[Product]>) in
////
////
////                var promise : Promise<PosterSpot> = Promise<PosterSpot>()
////            for client in clients {
////                promise = promise.then{ _ in
////                    return GetSpotsForClent(posterClient: client)}
////            }
////
////            return Promise<[PosterSpot]> { (fulfill, _) in
////            var spots = [PosterSpot]()
////            for client in clients {
////                GetSpotsForClent(posterClient: client).then{
////                    spot in
////                    print("\(spot.response.count)")
////                    spots.append(spot)
////                }
////            }
////
////                fulfill(spots)
////            //return users
////            }
////            }.then{ spots in
////
////
////            }.catch{error in
////            print("\(error)")
////        }
//
//    }

//    static func GetPosterUsers(completion: @escaping ([PosterUser]) -> Void){
//        if let usrs = users {
//            completion(usrs);
//            return
//        }
//
//        if State == .mock{
//            GetUserMock(completion: completion)
//            return
//        }
//        users = [PosterUser]();
//
//        firstly {
//
//        }
//        GetListClient(completion: completion);
//    if (posterClients != null)
//    {
//    for client in posterClients {
//        var spots = await GetSpotsForClent(client);
//        var icon = await GetIcon(client);
//        var products = await GetProducts(client);
//        if (spots != null)
//        {
//        var posterPlaces = new PosterPlace[spots.response.Count];
//        for (int i = 0; i < spots.response.Count; i++)
//        {
//            var place = spots.response[i];
//            posterPlaces[i] = new PosterPlace(int.Parse(place.spot_id), place.spot_name, place.spot_adress, new string[0], "", "");
//        }
//        Users.Add(new PosterUser(client.Account, client.Token, client.Account, icon, posterPlaces, products));
//        }
//    }
//
//        return Users;
//    }
//    else
//    {
//        return GetUserMock(completion: completion)
//    }
//}
//
    static func sendRequest<T: Decodable>(endpoint: String) -> Promise<[T]> {
        return Alamofire.request(endpoint).responseData()
            .then {response in
                return Promise<[T]>{ (fulfill, reject) in
                    
                    guard let res = try? JSONDecoder().decode([T].self, from: response)
                        else {
                            reject(NSError.cancelledError())
                            return
                    }
                    fulfill(res)
                }
            }.catch {error in
                print("\(error)")
        }
    }
    static func sendRequestSingle<T: Decodable>(endpoint: String) -> Promise<T> {
        return Alamofire.request(endpoint).responseData()
            .then {response in
                return Promise<T>{ (fulfill, reject) in
                    
                    guard let res = try? JSONDecoder().decode(T.self, from: response)
                        else {
                            reject(NSError.cancelledError())
                            return
                    }
                    fulfill(res)
                }
        }
    }

    static func GetUserMock() -> Promise<[PosterUser]>{
        let endpoint = "https://demo1163857.mockable.io"
        return sendRequest(endpoint: endpoint)
    }

    private static func GetListClient() -> Promise<[Client]>{
        let endpoint = "http://31.131.23.61/clients"
        return sendRequest(endpoint: endpoint)
    }

    private static func GetSpotsForClent(posterClient : Client) -> Promise<PosterSpot>{

        let url = "https://\(posterClient.account).joinposter.com/api/access.getSpots?token=\(posterClient.token)";
        return sendRequestSingle(endpoint: url)
    }

    private static func GetIcon(posterClient : Client) -> Promise<String> {
        let url = "https://\(posterClient.account).joinposter.com/api/settings.getAllSettings?token=\(posterClient.token)";
        return sendRequestSingle(endpoint: url)
    }

    private static func GetProducts(posterClient : Client) -> Promise<Product> {
            let url = "https://\(posterClient.account).joinposter.com/api/menu.getProducts?token=\(posterClient.token)";
            return sendRequestSingle(endpoint: url)
    }
    
}
