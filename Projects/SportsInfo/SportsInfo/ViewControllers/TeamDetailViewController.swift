//
//  TeamDetailViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 20.01.2021.
//

import UIKit

class TeamDetailViewController: BaseViewController {
    
    @IBOutlet private weak var teamImage: UIImageView!
    @IBOutlet private weak var teamName: UILabel!
    @IBOutlet private weak var teamLeague: UILabel!
    @IBOutlet private weak var teamStadium: UILabel!
    @IBOutlet private weak var teamCountry: UILabel!
    @IBOutlet private weak var teamDescription: UILabel!
    @IBOutlet private weak var teamJerseyLabel: UILabel!
    @IBOutlet private weak var teamJersey: UIImageView!
    @IBOutlet weak var teamJerseyStackView: UIStackView!
    
    var team: [String:String?]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        if let eventTeam = team {
            teamImage.downloadImage(imageUrl: (eventTeam[Constants.EventInfo.teamBadge] ?? "") ?? "")
            teamName.text = eventTeam[Constants.EventInfo.teamName] ?? ""
            teamLeague.text = "League: " + ((eventTeam[Constants.EventInfo.eventLeague] ?? "") ?? "")
            teamStadium.text = "Stadium: "  + ((eventTeam[Constants.EventInfo.teamStadium] ?? "") ?? "")
            teamCountry.text = "Country: " + ((eventTeam[Constants.EventInfo.eventCountry] ?? "") ?? "")
            teamDescription.text = "Description: " + ((eventTeam[Constants.EventInfo.teamDescription] ?? "") ?? "")
            teamJersey.downloadImage(imageUrl: (eventTeam[Constants.EventInfo.teamJersey] ?? "") ?? "")
        }
    }
}
