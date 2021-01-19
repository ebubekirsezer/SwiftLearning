//
//  MatchEventViewCell.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class MatchEventViewCell: UITableViewCell {
    
    @IBOutlet private weak var matchHomeTeamName: UILabel!
    @IBOutlet private weak var matchAwayTeamName: UILabel!
    @IBOutlet private weak var matchDateLabel: UILabel!
    @IBOutlet private weak var matchHomeTeamScore: UILabel!
    @IBOutlet private weak var matchAwayTeamScore: UILabel!
    @IBOutlet private weak var matchStadium: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func configureWith(event: [String : String?]) {
        matchHomeTeamName.text = event["strHomeTeam"] ?? ""
        matchHomeTeamScore.text = event["intHomeScore"] ?? ""
        matchAwayTeamName.text = event["strAwayTeam"] ?? ""
        matchAwayTeamScore.text = event["intAwayScore"] ?? ""
        matchDateLabel.text = (event["intRound"]  ?? "")! + ". Week"
        matchStadium.text = event["strVenue"] ?? ""
    }
}
