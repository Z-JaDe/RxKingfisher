//
//  Kingfisher+View.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

extension Kingfisher where Base: ImageView {
    func setIndicatorType(_ indicatorType: IndicatorType) -> Self {
        self.indicatorType = indicatorType
        return self
    }
}
