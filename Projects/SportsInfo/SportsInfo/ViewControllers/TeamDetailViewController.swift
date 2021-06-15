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
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        if let eventTeam = team {
            teamImage.downloadImage(imageUrl: eventTeam.strTeamBadge ?? "")
            teamName.text = eventTeam.strTeam
            teamLeague.text = "League: " + (eventTeam.strLeague ?? "")
            teamStadium.text = "Stadium: "  + (eventTeam.strStadium ?? "")
            teamCountry.text = "Country: " + (eventTeam.strCountry ?? "")
            teamDescription.text = "Description: " + (eventTeam.strDescriptionEN ?? "")
            teamJersey.downloadImage(imageUrl: eventTeam.strDescriptionEN ?? "")
        }
    }
}
