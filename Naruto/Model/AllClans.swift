//
//  AllClans.swift
//  Naruto
//
//  Created by user on 02/07/24.
//

import Foundation

// MARK: - AllClans
struct AllClans: Codable {
    let clans: [Clan]
}

// MARK: - Clan
struct Clan: Codable {
    let id: Int
    let name: String
    let characters: [Character]
}
