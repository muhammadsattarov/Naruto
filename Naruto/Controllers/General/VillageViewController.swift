//
//  VillageViewController.swift
//  Naruto
//
//  Created by user on 03/07/24.
//

import UIKit

class VillageViewController: UIViewController {

  private let tableView: UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(FirstViewTableViewCell.self,
                forCellReuseIdentifier: FirstViewTableViewCell.cellId)
    return $0
  }(UITableView())

  var village = [Village]()

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    getData()
  }

  private func setupViews() {
    view.backgroundColor = .secondarySystemBackground
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    navigationItem.title = "Nruto"
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  private func getData() {
    DataFetcherService.shared.fetchVillages(url: Constants.villagesUrl) { [weak self] result in
      self?.village = result?.villages ?? []
      self?.tableView.reloadData()
    }
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension VillageViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return village.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewTableViewCell.cellId, for: indexPath) as! FirstViewTableViewCell
    cell.configure(name: village[indexPath.row].name)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90
  }
}
