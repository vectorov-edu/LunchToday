//
//  ViewController.swift
//  LunchToday
//
//  Created by Admin on 12.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import UIKit

class FavoritesListViewController: UIViewController {

    var placesList : [VisualPlace] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "PlaceItemTableCell", bundle: Bundle.main), forCellReuseIdentifier: PlaceItemTableViewCell.key)
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global(qos: .utility).async {
            //self.InitDataSource()
        }
    }


}

extension FavoritesListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceItemTableViewCell.key, for: indexPath) as! PlaceItemTableViewCell
        
        cell.updateUI(place: placesList[indexPath.row])
        
        return cell;
    }
}

