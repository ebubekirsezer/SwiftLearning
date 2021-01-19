//
//  LeagueViewCell.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 19.01.2021.
//

import UIKit

class LeagueViewCell: UITableViewCell {

    @IBOutlet private weak var leagueImage: UIImageView!
    @IBOutlet private weak var leagueName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(league: [String:String?]){
        leagueImage.downloadImage(imageUrl: (league[Constants.EventInfo.eventBadge] ?? "") ?? "")
        leagueName.text = league[Constants.EventInfo.eventLeague] ?? ""
    }
    
}
