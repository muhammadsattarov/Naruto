//
//  Teams.swift
//  Naruto
//
//  Created by user on 03/07/24.
//
import Foundation

// MARK: - Teams
struct Teams: Codable {
    let teams: [Team]
    let currentPage, pageSize, totalTeams: Int
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let name: String
    let characters: [Character]
}
