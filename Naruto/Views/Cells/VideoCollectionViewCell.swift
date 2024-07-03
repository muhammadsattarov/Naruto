//
//  VideoCollectionViewCell.swift
//  Naruto
//
//  Created by user on 22/06/24.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {

  static let cellId = "VideoCollectionViewCell"

  private let imageOfView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    return $0
  }(UIImageView())

  private let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 16, weight: .semibold)
    $0.textColor = .label
    $0.textAlignment = .center
    $0.numberOfLines = 2
    return $0
  }(UILabel())

  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    setConstrains()
  }

  func configure(with model: videoModel) {
    imageOfView.image = UIImage(named: model.image)
    titleLabel.text = model.title
  }

  private func setup() {
    contentView.addSubview(imageOfView)
    contentView.addSubview(titleLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.backgroundColor = .systemBackground
    contentView.layer.shadowColor = UIColor.black.cgColor
    contentView.layer.shadowRadius = 4
    contentView.layer.shadowOffset = CGSize(width: 4, height: 0)
  }
  
}

// MARK: - Constrains
extension VideoCollectionViewCell {
  private func setConstrains() {
    NSLayoutConstraint.activate([
      imageOfView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageOfView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      imageOfView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      imageOfView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

      titleLabel.topAnchor.constraint(equalTo: imageOfView.bottomAnchor, constant: 5),
      titleLabel.leftAnchor.constraint(equalTo: imageOfView.leftAnchor, constant: 25),
      titleLabel.rightAnchor.constraint(equalTo: imageOfView.rightAnchor, constant: -25),
    ])
  }
}

