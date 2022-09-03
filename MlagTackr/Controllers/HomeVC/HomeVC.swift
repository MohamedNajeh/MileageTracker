//
//  HomeVC.swift
//  MlagTackr
//
//  Created by Najeh on 01/09/2022.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}
