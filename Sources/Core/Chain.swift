//
//  Chain.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

extension Chain: KingfisherCompatible {}

public class Chain {
    var options: KingfisherOptionsInfo = KingfisherOptionsInfo()

    var progressBlock: DownloadProgressBlock?
    var completionHandler: CompletionHandler?

    public func addOption(_ item: KingfisherOptionsInfoItem) {
        self.options.append(item)
    }
}
// MARK: -

public class ViewChain<View: UIView>: Chain {
    public let view: View
    init(view: View) {
        self.view = view
    }
}

// MARK: -
public class ManagerChain: Chain {
    public typealias _Manager = DownloadManager
    public let manager: _Manager
    init(manager: _Manager) {
        self.manager = manager
    }
}
private var imageViewPlaceholderKey: UInt8 = 0
extension ViewChain where View: ImageView {
    public var placeholder: Placeholder? {
        get {return objc_getAssociatedObject(self, &imageViewPlaceholderKey) as? Placeholder}
        set {objc_setAssociatedObject(self, &imageViewPlaceholderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)}
    }
}
private var buttonPlaceholderKey: UInt8 = 0
extension ViewChain where View: Button {
    public var placeholder: Image? {
        get {return objc_getAssociatedObject(self, &buttonPlaceholderKey) as? Image}
        set {objc_setAssociatedObject(self, &buttonPlaceholderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)}
    }
}
