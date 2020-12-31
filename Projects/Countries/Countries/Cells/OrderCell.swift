//
//  OrderCell.swift
//  Countries
//
//  Created by Ebubekir Sezer on 31.12.2020.
//

import UIKit

class OrderCell: UITableViewCell{

    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var radioButtonView: RadioButtonView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(order: Order){
        orderName.text = order.orderType
    }
    
}
