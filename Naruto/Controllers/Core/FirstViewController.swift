//
//  FirstViewController.swift
//  Naruto
//
//  Created by user on 23/06/24.
//

import UIKit

class FirstViewController: UIViewController {

  private let tableView: UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(FirstViewTableViewCell.self,
                forCellReuseIdentifier: FirstViewTableViewCell.cellId)
    return $0
  }(UITableView())
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  private func setupViews() {
    view.backgroundColor = .secondarySystemBackground
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    navigationItem.title = "Nruto"
    navigationController?.navigationBar.prefersLargeTitles = true
    Service.shared.getAllCharacters { result in
      
    }
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewTableViewCell.cellId, for: indexPath) as! FirstViewTableViewCell

    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
}
