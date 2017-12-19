////
////  PosterUsersService.swift
////  LunchToday
////
////  Created by Admin on 17.12.2017.
////  Copyright © 2017 lunchtoday. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//enum AppState {
//    case mock
//    case real
//}
//
//public class PosterUsersService{
//    static var Users : [PosterUser]
//    
//    static let State = AppState.real
//    
//    static func GetPosterUsers() -> [PosterUser]{
//        if let users = Users {
//            return users;
//        }
//        
//        if State == .mock{
//            return await Task.FromResult(GetUserMock());
//        }
//        Users = [PosterUser]();
//    
//    var posterClients = await GetListClient();
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
//        let asset = NSDataAsset(name: "MockData")
//        let data = asset?.data
//        let users = try? JSONDecoder().decode(PosterUser.self, from: data)
//        return users //await Task.FromResult(GetUserMock(Bundle.main.));
//    }
//}
//    
//    
//private static List<PosterUser> GetUserMock()
//{
//    var res = new List<PosterUser>();
//    //var gurmaniaDj = new PosterPlace(0, "Djuzeppe", "Днепр, пр.Героев, 3, ТЦ Кодак", new []{"0503402214", "0973402214"}, "http://gurmans.dp.ua/giuseppe/content/23-contact");
//    //var gurmaniaBav = new PosterPlace(1, "Bavarius", "Днепр, ул.Глинки, 2, ТРЦ Мост-Сити центр", new[] { "0503402214", "0973402214" }, "http://gurmans.dp.ua/bavarius/content/14-contact");
//    
//    //var confettiPobeda = new PosterPlace(0, "Confetti", "Днепр, пр. Героев, 1м", new []{"0563785269", "0675862036"}, "http://confetti.in.ua/ru/menu/biznes_lanchi/");
//    //var confettiPis = new PosterPlace(0, "Confetti", "Днепр, ул. Писаржевского, 12", new[] { "0675605168"}, "http://confetti.in.ua/ru/menu/biznes_lanchi/");
//    
//    //res.Add(new PosterUser("0", "0", "Gurmaniya", "", new []{ gurmaniaDj, gurmaniaBav}));
//    //res.Add(new PosterUser("1", "1", "Confetti", "", new []{confettiPobeda, confettiPis}));
//    res = JsonConvert.DeserializeObject<List<PosterUser>>(Bundle();
//    
//    return res;
//}
//    
//private static async Task<List<Client>> GetListClient()
//{
//    using (var client = new HttpClient())
//    {
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
//    }
//}
//
//private static async Task<PosterSpot> GetSpotsForClent(Client posterClient)
//{
//    
//    using (var client = new HttpClient())
//    {
//    try
//    {
//        var url = $"https://{posterClient.Account}.joinposter.com/api/access.getSpots?token={posterClient.Token}";
//        var resp = await client.GetAsync(url);
//        var restStr = await resp.Content.ReadAsStringAsync();
//        var clients = JsonConvert.DeserializeObject<PosterSpot>(restStr);
//        return clients;
//    }
//    catch (Exception ex)
//    {
//        Debug.WriteLine(ex.Message);
//        return null;
//    }
//    }
//    
//}
//    
//private static async Task<string> GetIcon(Client posterClient)
//{
//    using (var client = new HttpClient())
//    {
//    try    {
//        var url = $"https://{posterClient.Account}.joinposter.com/api/settings.getAllSettings?token={posterClient.Token}";
//        var resp = await client.GetAsync(url);
//        var restStr = await resp.Content.ReadAsStringAsync();
//        var respValue = JsonConvert.DeserializeObject<JObject>(restStr);
//        var response = respValue["response"]["logo"];
//        var iconUrl = $"https://{posterClient.Account}.joinposter.com{response}";
//        var icon = await client.GetAsync(iconUrl);
//        var iconBytes = await icon.Content.ReadAsByteArrayAsync();
//        var iconBase64 = Convert.ToBase64String(iconBytes);
//        return iconBase64;
//    }
//    catch (Exception ex)
//    {
//        Debug.WriteLine(ex.Message);
//        return null;
//    }
//    }
//}
//    
//private static async Task<List<Product>> GetProducts(Client posterClient){
//    using (var client = new HttpClient())
//    {
//    try
//    {
//        var url = "https://\(posterClient.Account).joinposter.com/api/menu.getProducts?token=\(posterClient.Token)";
//        var resp = await client.GetAsync(url);
//        var restStr = await resp.Content.ReadAsStringAsync();
//        var respValue = JsonConvert.DeserializeObject<JObject>(restStr);
//        var array = respValue["response"];
//        var res = new List<Product>();
//        for product in array {
//            res.Add(new Product(product["product_name"].ToString(),
//            product["category_name"].ToString(),
//            int.Parse(product["menu_category_id"].ToString()),
//            "https://\(posterClient.Account).joinposter.com" + product["photo"],
//            Double.Parse(product["price"]["1"].ToString()) / 100));
//        }
//
//        return res.OrderBy(f => f.CategoryId).ThenBy(f => f.Name).ToList();
//    }
//    catch (Exception ex)
//    {
//        print(ex.Message);
//        return null;
//    }
//    }
//    }
//}

