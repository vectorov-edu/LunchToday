//
//  PosterUsersService.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import Foundation
import Alamofire

enum AppState {
    case mock
    case real
}

public class PosterUsersService{
    static var users : [PosterUser]?
    
    static let State = AppState.real
    
    static func GetPosterUsers(completion: @escaping ([PosterUser]) -> Void){
        if let usrs = users {
            completion(usrs);
            return
        }
        
        if State == .mock{
            GetUserMock(completion: completion)
            return
        }
        users = [PosterUser]();
    
        GetListClient(completion: completion);
    if (posterClients != null)
    {
    for client in posterClients {
        var spots = await GetSpotsForClent(client);
        var icon = await GetIcon(client);
        var products = await GetProducts(client);
        if (spots != null)
        {
        var posterPlaces = new PosterPlace[spots.response.Count];
        for (int i = 0; i < spots.response.Count; i++)
        {
            var place = spots.response[i];
            posterPlaces[i] = new PosterPlace(int.Parse(place.spot_id), place.spot_name, place.spot_adress, new string[0], "", "");
        }
        Users.Add(new PosterUser(client.Account, client.Token, client.Account, icon, posterPlaces, products));
        }
    }
    
        return Users;
    }
    else
    {
        return GetUserMock(completion: completion)
    }
}

    private static func sendRequest<T: Decodable>(endpoint: String, completion: @escaping ([T]) -> Void){
        Alamofire.request(endpoint).responseJSON{response in
            guard let list = try? JSONDecoder().decode([T].self, from: response.data!) else {return}
            completion(list)
    }
    
    private static func GetUserMock(completion: @escaping ([PosterUser]) -> Void){
        let endpoint = "https://demo1163857.mockable.io"
        sendRequest(endpoint: endpoint, completion: completion)
    }
}
    
private static func GetListClient(completion: @escaping ([PosterUser]) -> Void){
    let endpoint = "http://31.131.23.61/clients"
    sendRequest(endpoint: endpoint, completion: completion)
//    try
//    {
//        var resp = await client.GetAsync("http://31.131.23.61/clients");
//        var restStr = await resp.Content.ReadAsStringAsync();
//        var clients = JsonConvert.DeserializeObject<List<Client>>(restStr);
//        return clients;
//    }
//    catch (Exception ex)
//    {
//        Debug.WriteLine(ex.Message);
//        return null;
//    }
}

private static async Task<PosterSpot> GetSpotsForClent(Client posterClient)
{
    
    using (var client = new HttpClient())
    {
    try
    {
        var url = $"https://{posterClient.Account}.joinposter.com/api/access.getSpots?token={posterClient.Token}";
        var resp = await client.GetAsync(url);
        var restStr = await resp.Content.ReadAsStringAsync();
        var clients = JsonConvert.DeserializeObject<PosterSpot>(restStr);
        return clients;
    }
    catch (Exception ex)
    {
        Debug.WriteLine(ex.Message);
        return null;
    }
    }
    
}
    
private static async Task<string> GetIcon(Client posterClient)
{
    using (var client = new HttpClient())
    {
    try    {
        var url = $"https://{posterClient.Account}.joinposter.com/api/settings.getAllSettings?token={posterClient.Token}";
        var resp = await client.GetAsync(url);
        var restStr = await resp.Content.ReadAsStringAsync();
        var respValue = JsonConvert.DeserializeObject<JObject>(restStr);
        var response = respValue["response"]["logo"];
        var iconUrl = $"https://{posterClient.Account}.joinposter.com{response}";
        var icon = await client.GetAsync(iconUrl);
        var iconBytes = await icon.Content.ReadAsByteArrayAsync();
        var iconBase64 = Convert.ToBase64String(iconBytes);
        return iconBase64;
    }
    catch (Exception ex)
    {
        Debug.WriteLine(ex.Message);
        return null;
    }
    }
}
    
private static async Task<List<Product>> GetProducts(Client posterClient){
    using (var client = new HttpClient())
    {
    try
    {
        var url = "https://\(posterClient.Account).joinposter.com/api/menu.getProducts?token=\(posterClient.Token)";
        var resp = await client.GetAsync(url);
        var restStr = await resp.Content.ReadAsStringAsync();
        var respValue = JsonConvert.DeserializeObject<JObject>(restStr);
        var array = respValue["response"];
        var res = new List<Product>();
        for product in array {
            res.Add(new Product(product["product_name"].ToString(),
            product["category_name"].ToString(),
            int.Parse(product["menu_category_id"].ToString()),
            "https://\(posterClient.Account).joinposter.com" + product["photo"],
            Double.Parse(product["price"]["1"].ToString()) / 100));
        }

        return res.OrderBy(f => f.CategoryId).ThenBy(f => f.Name).ToList();
    }
    catch (Exception ex)
    {
        print(ex.Message);
        return null;
    }
    }
    }
}


