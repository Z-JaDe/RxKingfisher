//
//  Kingfisher+OptionInfo.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

public extension Kingfisher where Base: KingfisherOptionCompatible {
    func targetCache(_ value:ImageCache) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.targetCache(value))
        return optionsInfo.kf
    }
    func originalCache(_ value:ImageCache) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.originalCache(value))
        return optionsInfo.kf
    }
    func downloader(_ value:ImageDownloader) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.downloader(value))
        return optionsInfo.kf
    }
    func transition(_ value:ImageTransition) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.transition(value))
        return optionsInfo.kf
    }
    func downloadPriority(_ value:Float) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.downloadPriority(value))
        return optionsInfo.kf
    }
    func forceRefresh() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.forceRefresh)
        return optionsInfo.kf
    }
    func fromMemoryCacheOrRefresh() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.fromMemoryCacheOrRefresh)
        return optionsInfo.kf
    }
    func forceTransition() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.forceTransition)
        return optionsInfo.kf
    }
    func cacheMemoryOnly() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.cacheMemoryOnly)
        return optionsInfo.kf
    }
    func waitForCache() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.waitForCache)
        return optionsInfo.kf
    }
    func onlyFromCache() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.onlyFromCache)
        return optionsInfo.kf
    }
    func backgroundDecode() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.backgroundDecode)
        return optionsInfo.kf
    }
    func callbackDispatchQueue(_ value:DispatchQueue) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.callbackDispatchQueue(value))
        return optionsInfo.kf
    }
    func scaleFactor(_ value:CGFloat) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.scaleFactor(value))
        return optionsInfo.kf
    }
    func preloadAllAnimationData() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.preloadAllAnimationData)
        return optionsInfo.kf
    }
    func requestModifier(_ value:ImageDownloadRequestModifier) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.requestModifier(value))
        return optionsInfo.kf
    }
    func processor(_ value:ImageProcessor) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.processor(value))
        return optionsInfo.kf
    }
    func cacheSerializer(_ value:CacheSerializer) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.cacheSerializer(value))
        return optionsInfo.kf
    }
    func imageModifier(_ value:ImageModifier) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.imageModifier(value))
        return optionsInfo.kf
    }
    func keepCurrentImageWhileLoading() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.keepCurrentImageWhileLoading)
        return optionsInfo.kf
    }
    func onlyLoadFirstFrame() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.onlyLoadFirstFrame)
        return optionsInfo.kf
    }
    func cacheOriginalImage() -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.addOption(.cacheOriginalImage)
        return optionsInfo.kf
    }
    
    func completionHandler(_ value:@escaping CompletionHandler) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.completionHandler = value
        return optionsInfo.kf
    }
    func progressBlock(_ value:@escaping DownloadProgressBlock) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.progressBlock = value
        return optionsInfo.kf
    }
}

public extension Kingfisher where Base: KingfisherOptionCompatible,
    Base.OptionInfoType:ViewOptionInfo<ImageView> {
    func placeholder(_ value:Placeholder) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.placeholder = value
        return optionsInfo.kf
    }
    
    @discardableResult
    func setImage(_ resource:Resource?) -> RetrieveImageTask {
        let optionsInfo = base.optionInfo
        return optionsInfo.view.kf.setImage(
            with: resource,
            placeholder: optionsInfo.placeholder,
            options: optionsInfo.options,
            progressBlock: optionsInfo.progressBlock,
            completionHandler: optionsInfo.completionHandler)
    }
}
public extension Kingfisher where Base: KingfisherOptionCompatible,
    Base.OptionInfoType:ViewOptionInfo<Button> {
    func placeholder(_ value:UIImage) -> Kingfisher<Base.OptionInfoType> {
        let optionsInfo = base.optionInfo
        optionsInfo.placeholder = value
        return optionsInfo.kf
    }
    
    @discardableResult
    func setImage(_ resource:Resource?, for state: UIControlState) -> RetrieveImageTask {
        let optionsInfo = base.optionInfo
        return optionsInfo.view.kf.setImage(
            with: resource, for: state,
            placeholder: optionsInfo.placeholder,
            options: optionsInfo.options,
            progressBlock: optionsInfo.progressBlock,
            completionHandler: optionsInfo.completionHandler)
    }
}
public extension Kingfisher where Base: KingfisherOptionCompatible,
    Base.OptionInfoType:ManagerOptionInfo {
    
    @discardableResult
    func retrieveImage(_ resource: Resource) -> RetrieveImageTask {
        let optionsInfo = base.optionInfo
        return optionsInfo.manager.retrieveImage(
            with: resource,
            options: optionsInfo.options,
            progressBlock: optionsInfo.progressBlock,
            completionHandler: optionsInfo.completionHandler)
    }
}

