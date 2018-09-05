//
//  ManagerCompatible.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

public typealias DownloadManager = KingfisherManager

protocol ManagerCompatible {
    associatedtype _ManagerType:DownloadManager
    var manager:_ManagerType {get}
}
extension ManagerOptionInfo:ManagerCompatible {}

extension ManagerCompatible where Self:DownloadManager {
    var manager:Self {
        return self
    }
}
extension DownloadManager:ManagerCompatible {}
extension DownloadManager:KingfisherCompatible {}
