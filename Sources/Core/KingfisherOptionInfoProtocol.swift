//
//  KingfisherOptionInfoProtocol.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

public protocol KingfisherOptionInfoProtocol:class {
    associatedtype ViewType:UIView
    typealias OptionInfoType = OptionInfo<ViewType>
    var optionsInfo:OptionInfoType {get}
    var view:ViewType {get}
}
extension OptionInfo:KingfisherOptionInfoProtocol {
    public var optionsInfo:OptionInfo<_View> {
        return self
    }
}
extension ImageView:KingfisherOptionInfoProtocol {
    public var optionsInfo: OptionInfo<ImageView> {
        return OptionInfo(view: self)
    }
    public var view:ImageView {
        return self
    }
}
extension Button:KingfisherOptionInfoProtocol {
    public var optionsInfo: OptionInfo<Button> {
        return OptionInfo(view: self)
    }
    public var view:Button {
        return self
    }
}
