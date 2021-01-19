//
//  EventDetailViewController.swift
//  SportsInfo
//
//  Created by Ebubekir Sezer on 19.01.2021.
//

import UIKit

class EventDetailViewController: BaseViewController {
    
    @IBOutlet private weak var eventImage: UIImageView!
    @IBOutlet private weak var roundedView: RoundedView!
    @IBOutlet private weak var eventHomeTeamName: UILabel!
    @IBOutlet private weak var eventAwayTeamName: UILabel!
    @IBOutlet private weak var eventHomeTeamScore: UILabel!
    @IBOutlet private weak var eventAwayTeamScore: UILabel!
    @IBOutlet private weak var eventLeague: UILabel!
    @IBOutlet private weak var eventType: UILabel!
    @IBOutlet private weak var eventDate: UILabel!
    @IBOutlet private weak var eventStadium: UILabel!
    @IBOutlet private weak var eventCountry: UILabel!
    @IBOutlet private weak var eventStatus: UILabel!
    
    var matchEvent: [String:String?] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        roundedView.roundCorners([.topLeft, .topRight], radius: 20)
        eventImage.downloadImage(imageUrl: (matchEvent[Constants.EventInfo.eventImage] ?? "") ?? "")
        eventHomeTeamName.text = matchEvent[Constants.EventInfo.eventHomeTeam] ?? ""
        eventAwayTeamName.text = matchEvent[Constants.EventInfo.eventAwayTeam] ?? ""
        eventHomeTeamScore.text = matchEvent[Constants.EventInfo.eventHomeScore] ?? ""
        eventAwayTeamScore.text = matchEvent[Constants.EventInfo.eventAwayScore] ?? ""
        eventLeague.text = "League: " + ((matchEvent[Constants.EventInfo.eventLeague] ?? "")!)
        eventType.text = "Type: " + ((matchEvent[Constants.EventInfo.eventType] ?? "")!)
        eventDate.text = "Date: " + ((matchEvent[Constants.EventInfo.eventDate] ?? "")!)
        eventStadium.text = "Stadium: " + ((matchEvent[Constants.EventInfo.eventStadium] ?? "")!)
        eventCountry.text = "Country: " + ((matchEvent[Constants.EventInfo.eventCountry] ?? "")!)
        eventStatus.text = "Status: " + ((matchEvent[Constants.EventInfo.eventStatus] ?? "")!)
    }
}
