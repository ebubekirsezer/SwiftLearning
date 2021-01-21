//
//  MatchEventViewCell.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 18.01.2021.
//

import UIKit

class MatchEventViewCell: UITableViewCell {
    
    @IBOutlet private weak var cardView: RoundedView!
    @IBOutlet private weak var matchHomeTeamName: UILabel!
    @IBOutlet private weak var matchAwayTeamName: UILabel!
    @IBOutlet private weak var matchDateLabel: UILabel!
    @IBOutlet private weak var matchHomeTeamScore: UILabel!
    @IBOutlet private weak var matchAwayTeamScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    func configureWith(event: [String : String?]) {
        matchHomeTeamName.text = event[Constants.EventInfo.eventHomeTeam] ?? ""
        matchHomeTeamScore.text = event[Constants.EventInfo.eventHomeScore] ?? ""
        matchAwayTeamName.text = event[Constants.EventInfo.eventAwayTeam] ?? ""
        matchAwayTeamScore.text = event[Constants.EventInfo.eventAwayScore] ?? ""
        matchDateLabel.text = (event[Constants.EventInfo.eventRound]  ?? "")! + ". Week"
    }
}
