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
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI(){
        navigationItem.title = "Event"
        roundedView.roundCorners([.topLeft, .topRight], radius: 20)
        eventImage.downloadImage(imageUrl: event?.strThumb ?? "")
        eventHomeTeamName.text = event?.strHomeTeam
        eventAwayTeamName.text = event?.strAwayTeam
        eventHomeTeamScore.text = event?.intHomeScore
        eventAwayTeamScore.text = event?.intAwayScore
        eventLeague.text = "League: \(event?.strLeague)"
        eventType.text = "Type: \(event?.strSport)"
        eventDate.text = "Date: \(event?.dateEvent)"
        eventStadium.text = "Stadium: \(event?.strVenue)"
        eventCountry.text = "Country: \(event?.strCountry)"
        eventStatus.text = "Status: \(event?.strStatus)" 
    }
}
