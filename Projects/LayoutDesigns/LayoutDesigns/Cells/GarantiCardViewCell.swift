//
//  GarantiCardViewCell.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 8.01.2021.
//

import UIKit

class GarantiCardViewCell: UICollectionViewCell {

    @IBOutlet weak var bankAccountID: UILabel!
    @IBOutlet weak var bankBalance: UILabel!
    @IBOutlet weak var bankLastOperation: UILabel!
    @IBOutlet weak var bankLastBalance: UILabel!
    @IBOutlet weak var bankLastOperationDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
