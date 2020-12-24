//
//  TableViewCell.swift
//  DocumentationProject
//
//  Created by Ebubekir Sezer on 23.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    
    func configure(with countryName: String){
        countryNameLabel.text = countryName
    }
}
