//
//  ViewController.swift
//  Naruto
//
//  Created by user on 22/06/24.
//

import UIKit
import SafariServices

class VideoViewController: UIViewController {

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.register(VideoCollectionViewCell.self,
                        forCellWithReuseIdentifier: VideoCollectionViewCell.cellId)
    collection.backgroundColor = .clear
    return collection
  }()

  private var items: [videoModel] = videoModel.collection

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .secondarySystemBackground
    view.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
    navigationItem.title = "Heroes"
    navigationItem.largeTitleDisplayMode = .always
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

extension VideoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.cellId, for: indexPath) as! VideoCollectionViewCell
    cell.configure(with: items[indexPath.row])
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cellUrl = items[indexPath.row].url
    guard let url = URL(string: cellUrl) else { return }
    let vc = SFSafariViewController(url: url)
    present(vc, animated: true)
  }

}

extension VideoViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellSize: CGFloat = (collectionView.frame.width-30)/2
    return CGSize(width: cellSize,
                  height: cellSize+40)
  }
}
