//
//  Service.swift
//  Naruto
//
//  Created by user on 22/06/24.
//

import Foundation

class Service {

  static let shared = Service()

  func getAllCharacters(url: String, completion: @escaping (Result<[Character], Error>) -> Void) {
    guard let url = URL(string: url) else { return }

    let request = URLRequest(url: url)

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      let decoder = JSONDecoder()
      do {
        let result = try decoder.decode(Characters.self, from: data)
        completion(.success(result.characters))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }

  
}

