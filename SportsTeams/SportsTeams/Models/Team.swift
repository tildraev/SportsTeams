//
//  Team.swift
//  SportsTeams
//
//  Created by Arian Mohajer on 1/22/22.
//

import Foundation

class Team {
    var name: String
    var ranking: Int
    var playerCount: Int
    
    init(name: String, ranking: Int, playerCount: Int) {
        self.name = name
        self.ranking = ranking
        self.playerCount = playerCount
    }
}

extension Team: Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        lhs.name == rhs.name &&
        lhs.ranking == rhs.ranking &&
        lhs.playerCount == rhs.playerCount
    }
    
    
}
