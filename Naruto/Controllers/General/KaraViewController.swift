//
//  KaraViewController.swift
//  Naruto
//
//  Created by user on 03/07/24.
//
import UIKit

class KaraViewController: UIViewController {

  private let tableView: UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(FirstViewTableViewCell.self,
                forCellReuseIdentifier: FirstViewTableViewCell.cellId)
    return $0
  }(UITableView())

  var kara = [Character]()

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
    DataFetcherService.shared.fetchKara(url: Constants.karaUrl) { [weak self] result in
      self?.kara = result?.kara ?? []
      self?.tableView.reloadData()
    }
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension KaraViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return kara.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewTableViewCell.cellId, for: indexPath) as! FirstViewTableViewCell
    cell.configure(with: kara[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90
  }
}
