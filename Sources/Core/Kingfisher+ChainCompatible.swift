//
//  Kingfisher+ChainCompatible.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import Kingfisher

public extension Kingfisher where Base: ChainCompatible {
    func targetCache(_ value: ImageCache) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.targetCache(value))
        return chain.kf
    }
    func originalCache(_ value: ImageCache) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.originalCache(value))
        return chain.kf
    }
    func downloader(_ value: ImageDownloader) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.downloader(value))
        return chain.kf
    }
    func transition(_ value: ImageTransition) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.transition(value))
        return chain.kf
    }
    func downloadPriority(_ value: Float) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.downloadPriority(value))
        return chain.kf
    }
    func forceRefresh() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.forceRefresh)
        return chain.kf
    }
    func fromMemoryCacheOrRefresh() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.fromMemoryCacheOrRefresh)
        return chain.kf
    }
    func forceTransition() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.forceTransition)
        return chain.kf
    }
    func cacheMemoryOnly() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.cacheMemoryOnly)
        return chain.kf
    }
    func waitForCache() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.waitForCache)
        return chain.kf
    }
    func onlyFromCache() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.onlyFromCache)
        return chain.kf
    }
    func backgroundDecode() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.backgroundDecode)
        return chain.kf
    }
    func callbackDispatchQueue(_ value: DispatchQueue) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.callbackDispatchQueue(value))
        return chain.kf
    }
    func scaleFactor(_ value: CGFloat) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.scaleFactor(value))
        return chain.kf
    }
    func preloadAllAnimationData() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.preloadAllAnimationData)
        return chain.kf
    }
    func requestModifier(_ value: ImageDownloadRequestModifier) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.requestModifier(value))
        return chain.kf
    }
    func processor(_ value: ImageProcessor) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.processor(value))
        return chain.kf
    }
    func cacheSerializer(_ value: CacheSerializer) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.cacheSerializer(value))
        return chain.kf
    }
    func imageModifier(_ value: ImageModifier) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.imageModifier(value))
        return chain.kf
    }
    func keepCurrentImageWhileLoading() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.keepCurrentImageWhileLoading)
        return chain.kf
    }
    func onlyLoadFirstFrame() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.onlyLoadFirstFrame)
        return chain.kf
    }
    func cacheOriginalImage() -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.addOption(.cacheOriginalImage)
        return chain.kf
    }

    func completionHandler(_ value:@escaping CompletionHandler) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.completionHandler = value
        return chain.kf
    }
    func progressBlock(_ value:@escaping DownloadProgressBlock) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.progressBlock = value
        return chain.kf
    }
}

public extension Kingfisher where Base: ChainCompatible,
Base.ChainType: ViewChain<ImageView> {
    func placeholder(_ value: Placeholder) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.placeholder = value
        return chain.kf
    }

    @discardableResult
    func setImage(_ resource: Resource?) -> RetrieveImageTask {
        let chain = base.chain()
        return chain.view.kf.setImage(
            with: resource,
            placeholder: chain.placeholder,
            options: chain.options,
            progressBlock: chain.progressBlock,
            completionHandler: chain.completionHandler)
    }
}
public extension Kingfisher where Base: ChainCompatible,
    Base.ChainType: ViewChain<Button> {
    func placeholder(_ value: UIImage) -> Kingfisher<Base.ChainType> {
        let chain = base.chain()
        chain.placeholder = value
        return chain.kf
    }

    @discardableResult
    func setImage(_ resource: Resource?, for state: UIControl.State) -> RetrieveImageTask {
        let chain = base.chain()
        return chain.view.kf.setImage(
            with: resource, for: state,
            placeholder: chain.placeholder,
            options: chain.options,
            progressBlock: chain.progressBlock,
            completionHandler: chain.completionHandler)
    }
}
public extension Kingfisher where Base: ChainCompatible,
    Base.ChainType: ManagerChain {

    @discardableResult
    func retrieveImage(_ resource: Resource) -> RetrieveImageTask {
        let chain = base.chain()
        return chain.manager.retrieveImage(
            with: resource,
            options: chain.options,
            progressBlock: chain.progressBlock,
            completionHandler: chain.completionHandler)
    }
}
