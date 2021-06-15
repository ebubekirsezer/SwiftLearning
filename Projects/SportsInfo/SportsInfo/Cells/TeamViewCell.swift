//
//  TeamViewCell.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 20.01.2021.
//

import UIKit

class TeamViewCell: UITableViewCell {

    @IBOutlet private weak var teamImage: UIImageView!
    @IBOutlet private weak var teamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func configureWith(team: Team) {
        teamImage.downloadImage(imageUrl: team.strTeamBadge ?? "")
        teamName.text = team.strTeam
    }
}
