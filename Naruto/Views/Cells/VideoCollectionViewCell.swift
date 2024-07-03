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
    $0.backgroundColor = .systemGray6
    $0.clipsToBounds = true
    return $0
  }(UIImageView())

  private let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .marker24()
    $0.textColor = .label
    $0.textAlignment = .center
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
    self.backgroundColor = .systemBackground
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowRadius = 4
    self.layer.shadowOffset = CGSize(width: 4, height: 0)
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

      titleLabel.topAnchor.constraint(equalTo: imageOfView.bottomAnchor, constant: 10),
      titleLabel.leftAnchor.constraint(equalTo: imageOfView.leftAnchor, constant: 10),
      titleLabel.rightAnchor.constraint(equalTo: imageOfView.rightAnchor, constant: -10),
    ])
  }
}

