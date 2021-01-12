//
//  GarantiCardViewCell.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 8.01.2021.
//

import UIKit

class GarantiCardViewCell: UICollectionViewCell {

    @IBOutlet private weak var bankAccountID: UILabel!
    @IBOutlet private weak var bankBalance: UILabel!
    @IBOutlet private weak var bankLastOperation: UILabel!
    @IBOutlet private weak var bankLastBalance: UILabel!
    @IBOutlet private weak var bankLastOperationDetail: UILabel!
    @IBOutlet private weak var bankLastCheck: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWith(bank: Bank){
        bankAccountID.text = bank.bankAccountID
        bankBalance.text = String(bank.bankBalance) + " TL"
        bankLastOperation.text = bank.bankLastOperation
        bankLastBalance.text = String(bank.bankLastOperationBalance)
        bankLastOperationDetail.text = bank.bankLastOperationDetail
        bankLastCheck.text = bank.bankLastCheck
    }

}
