//
//  TeamsTableViewController.swift
//  SportsTeams
//
//  Created by Arian Mohajer on 1/22/22.
//

import UIKit

class TeamsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Reload the tableview when the view is about to appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    //Sets number of rows in the table view = to the number of "teams" in our source of truth
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamController.sharedInstance.teams.count
    }

    //Provides custom cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamTableViewCell else {return UITableViewCell()}

        // Configure the cell...
        
        cell.updateView(team: TeamController.sharedInstance.teams[indexPath.row])

        return cell
    }

    // Allows for swiping and deleting a row
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            TeamController.sharedInstance.teams.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Identity
        if segue.identifier == "toDetailVC" {
            //Index
            if let index = tableView.indexPathForSelectedRow {
                //Destination
                if let destination = segue.destination as? DetailViewController {
                    //Object to send
                    let team = TeamController.sharedInstance.teams[index.row]
                    //Object that will receive
                    destination.team = team
                }
            }
        }
    }
}
