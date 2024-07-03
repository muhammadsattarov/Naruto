//
//  AllCases.swift
//  Naruto
//
//  Created by user on 23/06/24.
//

import Foundation

struct AllCases {
  let title: String
  let image: String

  static let collection: [AllCases] = [
    .init(title: "Characters", image: "Characters"),
    .init(title: "Clans", image: "Clans"),
    .init(title: "Villages", image: "Villages"),
    .init(title: "Kekkei Genkai", image: "Kekkei Genkai"),
    .init(title: "Tailed Beasts", image: "Tailed Beasts"),
    .init(title: "Teams", image: "Teams"),
    .init(title: "Kara", image: "Kara"),
    .init(title: "Akatsuki", image: "Akatsuki"),
  ]
}

enum Sections: Int, CaseIterable {
  case characters = 0
  case clans
  case villages
  case kekkaiGenkai
  case tailedBeasts
  case teams
  case kara
  case akatsuki
}
