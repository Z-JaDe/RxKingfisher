//
//  KingfisherOptionCompatible.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

public protocol KingfisherOptionCompatible:class {
    associatedtype OptionInfoType:OptionInfo
    var optionInfo:OptionInfoType {get}
}

extension ManagerOptionInfo:KingfisherOptionCompatible {
    public var optionInfo:ManagerOptionInfo {
        return self
    }
}
extension ViewOptionInfo:KingfisherOptionCompatible {
    public var optionInfo:ViewOptionInfo {
        return self
    }
}

extension ImageView:KingfisherOptionCompatible {
    public var optionInfo: ViewOptionInfo<ImageView> {
        return ViewOptionInfo(view: self)
    }
}
extension Button:KingfisherOptionCompatible {
    public var optionInfo: ViewOptionInfo<Button> {
        return ViewOptionInfo(view: self)
    }
}
extension DownloadManager:KingfisherOptionCompatible {
    public var optionInfo: ManagerOptionInfo {
        return ManagerOptionInfo(manager: self)
    }
}
