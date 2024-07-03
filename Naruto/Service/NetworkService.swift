//
//  Service.swift
//  Naruto
//
//  Created by user on 22/06/24.
//

import Foundation

protocol Networking {
  func request(url: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: Networking {

  func request(url: String, completion: @escaping (Data?, Error?) -> Void) {
    guard let url = URL(string: url) else { return }
    let request = URLRequest(url: url)
    let task = createDataTask(from: request, completion: completion)
    task.resume()
  }

  func createDataTask(from request: URLRequest,
                      completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
    return URLSession.shared.dataTask(with: request) { data, _, error in
      DispatchQueue.main.async {
        completion(data, error)
      }
    }
  }
}

