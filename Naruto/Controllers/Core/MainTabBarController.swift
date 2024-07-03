//
//  MainTabBarController.swift
//  Naruto
//
//  Created by user on 23/06/24.
//

import UIKit


class MainTabBarController: UITabBarController {


  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let firstVC = UINavigationController(rootViewController: FirstViewController())
    let videoVC = UINavigationController(rootViewController: VideoViewController())

    firstVC.tabBarItem.image = UIImage(systemName: "list.dash")
    videoVC.tabBarItem.image = UIImage(systemName: "play.rectangle")
    setViewControllers([firstVC, videoVC], animated: true)
  }

}
