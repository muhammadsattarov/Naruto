//
//  FirstViewTableViewCell.swift
//  Naruto
//
//  Created by user on 23/06/24.
//

import UIKit
import SDWebImage

class FirstViewTableViewCell: UITableViewCell {

  static let cellId = "FirstViewTableViewCell"

  private let imageOfView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.backgroundColor = .systemGray6
    return $0
  }(UIImageView())

  private let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .marker24()
    $0.textColor = .label
    return $0
  }(UILabel())

  private let containerView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .systemBackground
    return $0
  }(UIView())

  // MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
     setup()
     setConstrains()
    selectionStyle = .none
  }
  
  func configure(_ model: AllCases) {
    titleLabel.text = model.title
    imageOfView.image = UIImage(named: model.image)
  }

  func configure(with model: Character) {
    titleLabel.text = model.name
    DispatchQueue.main.async {
      self.imageOfView.sd_setImage(with: URL(string: model.images.first ?? ""))
    }
  }

  func configure(name title: String) {
    titleLabel.text = title
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    imageOfView.image = nil
  }

  private func setup() {
    self.backgroundColor = .clear
    contentView.addSubview(containerView)
    containerView.addSubview(imageOfView)
    containerView.addSubview(titleLabel)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Constrains
extension FirstViewTableViewCell {
  private func setConstrains() {
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
      containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
      containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),

      imageOfView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      imageOfView.topAnchor.constraint(equalTo: containerView.topAnchor),
      imageOfView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
      imageOfView.heightAnchor.constraint(equalToConstant: 80),
      imageOfView.widthAnchor.constraint(equalToConstant: 80),

      titleLabel.leftAnchor.constraint(equalTo: imageOfView.rightAnchor, constant: 15),
      titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
      titleLabel.centerYAnchor.constraint(equalTo: imageOfView.centerYAnchor),
    ])
  }
}
