//
//  PlacesListViewController.swift
//  LunchToday
//
//  Created by Admin on 17.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import UIKit
import MapKit

class PlacesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var placesList : [VisualPlace] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib.init(nibName: "PlaceItemTableCell", bundle: Bundle.main), forCellReuseIdentifier: PlaceItemTableViewCell.key)
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global(qos: .utility).async {
            self.InitDataSource()
        }
    }
    
    private func InitDataSource()
    {
//        var usersList = PosterUsersDal.GetPosterUsers();
//        var visualPlaceslist = VisualPlaceModelCreator().GetPlaces(usersList);
//
//        DispatchQueue.main.async {
//            tableView.DataSource = self //PlacesCollectionDataSource(visualPlaceslist, GoToDetailPlace);
//        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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