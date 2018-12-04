//
//  ViewCompatible.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

protocol ViewCompatible {
    associatedtype _ViewType: UIView
    var view: _ViewType {get}
}
extension ViewChain: ViewCompatible {}

extension ViewCompatible where Self: UIView {
    var view: Self {
        return self
    }
}
extension ImageView: ViewCompatible {}
extension Button: ViewCompatible {}
