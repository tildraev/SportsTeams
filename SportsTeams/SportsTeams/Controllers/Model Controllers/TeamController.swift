//
//  TeamController.swift
//  SportsTeams
//
//  Created by Arian Mohajer on 1/22/22.
//

import Foundation

class TeamController {
    // MARK: - Properties
    ///Singleton
    static var sharedInstance = TeamController()
    ///Source of truth
    var teams = [Team]()
    
    //CRUD functions
    func createTeam(name: String, ranking: Int, playerCount: Int) {
        let team = Team(name: name, ranking: ranking, playerCount: playerCount)
        teams.append(team)
        sort()
    }
    
    func updateTeam(team: Team, name: String, ranking: Int, playerCount: Int) {
        team.name = name
        team.ranking = ranking
        team.playerCount = playerCount
        sort()
    }
    
    func deleteTeam(teamToDelete: Team) {
        guard let index = teams.firstIndex(where: {$0 == teamToDelete}) else {return}
        teams.remove(at: index)
        sort()
    }
    
    //Using this, the app sorts by team rank
    func sort() {
        TeamController.sharedInstance.teams = TeamController.sharedInstance.teams.sorted(by: {$0.ranking < $1.ranking})
    }
}
