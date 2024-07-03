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
    $0.separatorStyle = .none
    $0.backgroundColor = .clear
    return $0
  }(UITableView())

  private var sections = [Sections]()
  private let allCases: [AllCases] = AllCases.collection

  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    navigationSettings()
  }

  private func setupViews() {
    view.backgroundColor = .secondarySystemBackground
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }

  private func navigationSettings() {
    navigationItem.title = "Nruto"
    navigationController?.navigationBar.prefersLargeTitles = true
  }



  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewTableViewCell.cellId, for: indexPath) as! FirstViewTableViewCell
    cell.configure(allCases[indexPath.row])
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch Sections(rawValue: indexPath.row) {
    case .characters:
      let vc = CharactersViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .clans:
      let vc = ClansViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .villages:
      let vc = VillageViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .kekkaiGenkai:
      let vc = KekkaiGenkaiViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .tailedBeasts:
      let vc = TailedBeastsViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .teams:
      let vc = TeamsViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .kara:
      let vc = KaraViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .akatsuki:
      let vc = AkatsukiViewController()
      vc.hidesBottomBarWhenPushed = true
      navigationController?.pushViewController(vc, animated: true)
    case .none:
      print("none")
    }
  }

}
