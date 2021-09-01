//
//  CustomTableViewCell.swift
//  ShindanMaker
//
//  Created by HechiZan on 2021/08/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
