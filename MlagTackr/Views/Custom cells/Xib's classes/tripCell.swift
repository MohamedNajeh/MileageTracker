//
//  tripCell.swift
//  MlagTackr
//
//  Created by Najeh on 01/09/2022.
//

import UIKit

class tripCell: UITableViewCell {

    @IBOutlet weak var tripTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title:String){
        tripTitleLbl.text = title
    }
    
}
