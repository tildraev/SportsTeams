//
//  DetailViewController.swift
//  SportsTeams
//
//  Created by Arian Mohajer on 1/22/22.
//

import UIKit

class DetailViewController: UIViewController {

    //If we have a team, work on that team. If not, let's create a new one. This is an optional value that handles both cases.
    var team: Team? = nil
    
    //text field outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rankingTextField: UITextField!
    @IBOutlet weak var playerCountTextField: UITextField!
    
    //button outlets
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    //Rounding out the corners of the buttons and updating views if we have things to update.
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.layer.cornerRadius = 5
        deleteButton.layer.cornerRadius = 5
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //If we got here to edit a team, set the values of the corresponding text fields = to the team's details.
    func updateViews() {
        if let team = team {
            nameTextField.text = team.name
            rankingTextField.text = String(team.ranking)
            playerCountTextField.text = String(team.playerCount)
        }
    }
    
    //Clears all text fields
    @IBAction func clearButtonTapped(_ sender: Any) {
        nameTextField.text = ""
        rankingTextField.text = ""
        playerCountTextField.text = ""
    }
    
    //If we got here to edit a team, this allows us to delete the team from the source of truth
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let team = team else {return}
        TeamController.sharedInstance.deleteTeam(teamToDelete: team)
        self.navigationController?.popViewController(animated: true)
    }
    
    //See below
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
              let rankingString = rankingTextField.text, !rankingString.isEmpty,
              let playerCountString = playerCountTextField.text, !playerCountString.isEmpty,
              let ranking = Int(rankingString),
              let playerCount = Int(playerCountString) else {return}
        
        if let team = team {
            //If a team exists, let's update it
            TeamController.sharedInstance.updateTeam(team: team, name: name, ranking: ranking, playerCount: playerCount)
        }
        else {
            //If we got here via the "+" button, we are trying to create a team.
            TeamController.sharedInstance.createTeam(name: name, ranking: ranking, playerCount: playerCount)
        }
        
        //Clears the navi controller off the screen
        self.navigationController?.popViewController(animated: true)
    }
}
