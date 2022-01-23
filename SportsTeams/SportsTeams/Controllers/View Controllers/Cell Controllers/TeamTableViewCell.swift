//
//  TeamTableViewCell.swift
//  SportsTeams
//
//  Created by Arian Mohajer on 1/22/22.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    // MARK: - Custom cell
    
    //Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    //updates the cell information
    func updateView(team: Team) {
        nameLabel.text = team.name
        countLabel.text = String(team.playerCount)
        rankLabel.text = "#\(team.ranking)"
    }
}
