//
//  ViewModelType.swift
//  CleanViewModel+RxSwift
//
//  Created by SUNG HAO LIN on 2019/5/28.
//  Copyright © 2019 GanNaSong. All rights reserved.
//

import Foundation

protocol ViewModelType {

  associatedtype Input
  associatedtype Output

  func transform(input: Input) -> Output
}
