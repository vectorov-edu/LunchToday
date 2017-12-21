//
//  ProductsListViewController.swift
//  LunchToday
//
//  Created by Admin on 21.12.17.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib.init(nibName: "ProductItemTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: ProductItemTableViewCell.key)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//extension ProductsListViewController : UITableViewDataSource {
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: ProductItemTableViewCell.key, for: indexPath) as! ProductItemTableViewCell
//        //cell.
//        return cell;
//    }
//}

