//
//  DataFetcher.swift
//  Naruto
//
//  Created by user on 24/06/24.
//

import Foundation

protocol DataFetcher {
  func fetchGenericJsonData<T: Codable>(urlString: String, responce: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {

  var networking: Networking
  init(networking: Networking = NetworkService()) {
    self.networking = networking
  }

  func fetchGenericJsonData<T>(urlString: String, responce: @escaping (T?) -> Void) where T : Decodable, T : Encodable {
    networking.request(url: urlString) { data, error in
      if let error = error {
        print(error)
        responce(nil)
      }
      let decoded = self.decodeJson(type: T.self, from: data)
      responce(decoded)
    }
  }

  func decodeJson<T: Codable>(type: T.Type, from data: Data?) -> T? {
    guard let data = data else { return nil }
    do {
      let objects = try JSONDecoder().decode(type.self, from: data)
      return objects
    } catch let jsonError {
      print(jsonError)
      return nil
    }
  }

}
