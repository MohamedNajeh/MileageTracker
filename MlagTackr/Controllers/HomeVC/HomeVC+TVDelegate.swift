//
//  HomeVC+TVDelegate.swift
//  MlagTackr
//
//  Created by Najeh on 01/09/2022.
//

import Foundation
import UIKit
extension HomeVC:UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if trips.count == 0 {
            noTripsLbl.isHidden = false
        }else{
            noTripsLbl.isHidden = true
        }
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! tripCell
        cell.configureCell(title: trips[indexPath.row].title ?? "trip")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(withIdentifier: "MapVC") as! MapVC
        vc.loc1 = trips[indexPath.row].firstLocation
        vc.loc2 = trips[indexPath.row].lastLocation
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
