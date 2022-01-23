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

extension Team: Comparable {
    static func < (lhs: Team, rhs: Team) -> Bool {
        lhs.ranking < rhs.ranking
    }

    static func == (lhs: Team, rhs: Team) -> Bool {
        lhs.ranking == rhs.ranking &&
        lhs.name == rhs.name &&
        lhs.playerCount == rhs.playerCount
    }
}
