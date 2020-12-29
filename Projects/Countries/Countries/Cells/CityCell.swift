//
//  CityCell.swift
//  Countries
//
//  Created by Ebubekir Sezer on 29.12.2020.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var regionName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(region: Region){
        regionName?.text = region.regionName
    }
}
