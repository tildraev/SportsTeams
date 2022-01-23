//
//  DetailViewController.swift
//  SportsTeams
//
//  Created by Arian Mohajer on 1/22/22.
//

import UIKit

class DetailViewController: UIViewController {

    var team: Team? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rankingTextField: UITextField!
    @IBOutlet weak var playerCountTextField: UITextField!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.layer.cornerRadius = 5
        deleteButton.layer.cornerRadius = 5
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        if let team = team {
            nameTextField.text = team.name
            rankingTextField.text = String(team.ranking)
            playerCountTextField.text = String(team.playerCount)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        nameTextField.text = ""
        rankingTextField.text = ""
        playerCountTextField.text = ""
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let team = team else {return}
        TeamController.sharedInstance.deleteTeam(teamToDelete: team)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
              let rankingString = rankingTextField.text, !rankingString.isEmpty,
              let playerCountString = playerCountTextField.text, !playerCountString.isEmpty,
              let ranking = Int(rankingString),
              let playerCount = Int(playerCountString) else {return}
        
        if let team = team {
            TeamController.sharedInstance.updateTeam(team: team, name: name, ranking: ranking, playerCount: playerCount)
        }
        else {
            TeamController.sharedInstance.createTeam(name: name, ranking: ranking, playerCount: playerCount)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
