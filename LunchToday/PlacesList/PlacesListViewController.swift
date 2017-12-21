//
//  PlacesListViewController.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import UIKit
import MapKit
import PromiseKit

class PlacesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var placesList : [VisualPlace] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib.init(nibName: "PlaceItemTableCell", bundle: Bundle.main), forCellReuseIdentifier: PlaceItemTableViewCell.key)
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global(qos: .utility).async {[weak self] in
            self?.InitDataSource()
        }
    }
    
    private func InitDataSource()
    {
        PosterUsersService.GetUserMock() //.GetPosterUsers();
        .then{[weak self] usersList in
            return Promise<Void> { _,_ in
            self?.placesList = VisualPlaceModelCreator().GetPlaces(posterUsers: usersList);

            DispatchQueue.main.async{[weak self] in
                guard let slf = self else {return}
                slf.tableView.dataSource = slf //PlacesCollectionDataSource(visualPlaceslist, GoToDetailPlace);
            }
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

extension PlacesListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceItemTableViewCell.key, for: indexPath) as! PlaceItemTableViewCell
        
        cell.updateUI(place: placesList[indexPath.row])
        
        return cell;
    }
}
