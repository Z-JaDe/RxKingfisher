//
//  ChainCompatible.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

public protocol ChainCompatible:class {
    associatedtype ChainType:Chain
    func chain() -> ChainType
}

extension ManagerChain:ChainCompatible {
    public func chain() -> ManagerChain {
        return self
    }
}
extension ViewChain:ChainCompatible {
    public func chain() -> ViewChain {
        return self
    }
}

extension ImageView:ChainCompatible {
    /// ZJaDe: 每次调用会创建一个实例
    public func chain() -> ViewChain<ImageView> {
        return ViewChain(view: self)
    }
}
extension Button:ChainCompatible {
    /// ZJaDe: 每次调用会创建一个实例
    public func chain() -> ViewChain<Button> {
        return ViewChain(view: self)
    }
}
extension DownloadManager:ChainCompatible {
    /// ZJaDe: 每次调用会创建一个实例
    public func chain() -> ManagerChain {
        return ManagerChain(manager: self)
    }
}
