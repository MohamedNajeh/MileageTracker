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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tripCell
        cell.configureCell(title: "Hello")
        return UITableViewCell()
    }
    
    
}
