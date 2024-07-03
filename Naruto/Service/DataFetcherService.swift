//
//  DataFetcherService.swift
//  Naruto
//
//  Created by user on 24/06/24.
//

import Foundation

class DataFetcherService {

  static let shared = DataFetcherService()

  var dataFetcher: DataFetcher
  init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
    self.dataFetcher = dataFetcher
  }

  func fetchCharacters(url: String, completion: @escaping (Characters?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }

  func fetchClans(url: String, completion: @escaping (AllClans?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }

  func fetchVillages(url: String, completion: @escaping (AllVillages?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }

  func fetchKekkaiGenkai(url: String, completion: @escaping (KekkaiGenkai?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }

  func fetchTailedBeasts(url: String, completion: @escaping (TailedBeast?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }

  func fetchTeams(url: String, completion: @escaping (Teams?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }

  func fetchKara(url: String, completion: @escaping (Kara?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }

  func fetchAkatsuki(url: String, completion: @escaping (Akatsuki?) -> Void) {
    dataFetcher.fetchGenericJsonData(urlString: url, responce: completion)
  }
}
