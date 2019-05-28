//
//  GNViewModel.swift
//  CleanViewModel+RxSwift
//
//  Created by SUNG HAO LIN on 2019/5/28.
//  Copyright © 2019 GanNaSong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class GNViewModel: ViewModelType {

  struct Input {
    let name: Observable<String>
    let validate: Observable<Void>
  }

  struct Output {
    let greeting: Driver<String>
  }

  func transform(input: Input) -> Output {
    let greeting = input.validate
      .withLatestFrom(input.name)
      .map { "Hello: \($0)" }
      .startWith("")
      .asDriver(onErrorJustReturn: ":-(")
    return Output(greeting: greeting)
  }

}
