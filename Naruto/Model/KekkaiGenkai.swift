//
//  KekkaiGenkai.swift
//  Naruto
//
//  Created by user on 03/07/24.
//

import Foundation

// MARK: - KekkaiGenkai
struct KekkaiGenkai: Codable {
    let kekkeigenkai: [Kekkeigenkai]
}

// MARK: - Kekkeigenkai
struct Kekkeigenkai: Codable {
    let id: Int
    let name: String
    let characters: [KekkeigenkaiCharacter]
}

// MARK: - Character
struct KekkeigenkaiCharacter: Codable {
    let id: Int
    let name: String
    let images: [String]
}
