//
//  ViewController.swift
//  CleanViewModel+RxSwift
//
//  Created by SUNG HAO LIN on 2019/5/28.
//  Copyright © 2019 GanNaSong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  let viewModel = GNViewModel()
  let disposeBag = DisposeBag()

  lazy var mainView: GNView = {
    let mainView = GNView()
    return mainView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubViews()
    bindViewModel()
  }

  // MARK: - Private Methods

  private func bindViewModel() {
    let inputs = GNViewModel.Input(name: mainView.textField.rx.text.orEmpty.asObservable(),
                                   validate: mainView.tapButton.rx.tap.asObservable())
    let outputs = viewModel.transform(input: inputs)

    outputs.greeting
      .drive(mainView.nameLabel.rx.text)
      .disposed(by: disposeBag)
  }

  private func setupSubViews() {
    view.addSubview(mainView)

    mainView.translatesAutoresizingMaskIntoConstraints = false

    let views = [
      "view": mainView,
    ]

    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|[view]|",
      options: [],
      metrics: nil,
      views: views
    ))
    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|[view]|",
      options: [],
      metrics: nil,
      views: views
    ))
  }

}

