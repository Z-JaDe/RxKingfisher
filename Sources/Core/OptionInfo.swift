//
//  OptionInfo.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher


extension OptionInfo:KingfisherCompatible {}

public class OptionInfo {
    var options:KingfisherOptionsInfo = KingfisherOptionsInfo()
    
    var progressBlock: DownloadProgressBlock? = nil
    var completionHandler: CompletionHandler? = nil
    
    public func addOption(_ item:KingfisherOptionsInfoItem) {
        self.options.append(item)
    }
}
// MARK: -

public class ViewOptionInfo<_View:UIView>:OptionInfo {
    public let view: _View
    init(view: _View) {
        self.view = view
    }
}

// MARK: -
public class ManagerOptionInfo:OptionInfo {
    typealias _Manager = DownloadManager
    let manager: _Manager
    init(manager: _Manager) {
        self.manager = manager
    }
}
private var imageViewPlaceholderKey:UInt8 = 0
extension ViewOptionInfo where _View:ImageView {
    public var placeholder: Placeholder? {
        get {return objc_getAssociatedObject(self, &imageViewPlaceholderKey) as? Placeholder}
        set {objc_setAssociatedObject(self, &imageViewPlaceholderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)}
    }
}
private var buttonPlaceholderKey:UInt8 = 0
extension ViewOptionInfo where _View:Button {
    public var placeholder: Image? {
        get {return objc_getAssociatedObject(self, &buttonPlaceholderKey) as? Image}
        set {objc_setAssociatedObject(self, &buttonPlaceholderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)}
    }
}
