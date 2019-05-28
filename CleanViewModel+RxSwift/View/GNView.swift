//
//  GNView.swift
//  CleanViewModel+RxSwift
//
//  Created by SUNG HAO LIN on 2019/5/28.
//  Copyright © 2019 GanNaSong. All rights reserved.
//

import UIKit

class GNView: UIView {

  lazy var textField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "input something"
    textField.textColor = .black
    textField.borderStyle = .roundedRect
    return textField
  }()

  lazy var tapButton: UIButton = {
    let tapButton = UIButton(type: .system)
    tapButton.setTitle("Validate", for: .normal)
    tapButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    tapButton.setTitleColor(UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1.0), for: .normal)
    tapButton.layer.cornerRadius = 15.0
    tapButton.layer.borderColor = UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1.0).cgColor
    tapButton.layer.borderWidth = 2
    return tapButton
  }()

  lazy var nameLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.text = ""
    nameLabel.textAlignment = .center
    nameLabel.textColor = .black
    nameLabel.font = .boldSystemFont(ofSize: 18)
    return nameLabel
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubViews()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupSubViews()
  }

  // MARK: - Private Methods

  private func setupSubViews() {
    addSubview(textField)
    addSubview(tapButton)
    addSubview(nameLabel)

    textField.translatesAutoresizingMaskIntoConstraints = false
    tapButton.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.translatesAutoresizingMaskIntoConstraints = false

    let views = [
      "field": textField,
      "button": tapButton,
      "label": nameLabel
    ]

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-(100)-[field]-(100)-|",
      options: [],
      metrics: nil,
      views: views
    ))
    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-(100)-[button]-(100)-|",
      options: [],
      metrics: nil,
      views: views
    ))
    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-(100)-[label]-(100)-|",
      options: [],
      metrics: nil,
      views: views
    ))
    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-(150)-[field(40)]-(100)-[button(40)]-(100)-[label(40)]",
      options: [],
      metrics: nil,
      views: views
    ))
  }

}
