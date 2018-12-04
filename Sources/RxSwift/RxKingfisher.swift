//
//  RxKingfisher.swift
//  RxKingfisher
//
//  Created by 郑军铎 on 2018/9/5.
//  Copyright © 2018年 ZJaDe. All rights reserved.
//

import Foundation
import RxSwift
import Kingfisher
public typealias ImageViewTupleType = (ImageView, Image?)
extension Kingfisher where Base: ChainCompatible,
    Base.ChainType: ViewChain<ImageView> {
    @discardableResult
    public func setImage(with resource: Resource?) -> Observable<ImageViewTupleType> {
        return Observable.create({ (observer) -> Disposable in
            let chain = self.base.chain()
            let completionHandler = chain.completionHandler
            if let resource = resource {
                let closure = self._completionHandler(observer: observer, { [weak chain] (image, _, _, _) in
                    guard let chain = chain else { return }
                    observer.onNext((chain.view, image))
                })
                let task: RetrieveImageTask = self.completionHandler(closure)
                    .setImage(resource)
                return Disposables.create {
                    task.cancel()
                }
            } else {
                completionHandler?(nil, nil, .none, nil)
                observer.onCompleted()
                return Disposables.create()
            }
        })
    }
}

public typealias ButtonTupleType = (Button, Image?, UIControl.State)
extension Kingfisher where Base: ChainCompatible,
    Base.ChainType: ViewChain<Button> {
    @discardableResult
    public func setImage(with resource: Resource?, for state: UIControl.State) -> Observable<ButtonTupleType> {
        return Observable.create({ (observer) -> Disposable in
            let chain = self.base.chain()
            let completionHandler = chain.completionHandler
            if let resource = resource {
                let closure = self._completionHandler(observer: observer, { [weak chain] (image, _, _, _) in
                    guard let chain = chain else { return }
                    observer.onNext((chain.view, image, state))
                })
                let task: RetrieveImageTask = self.completionHandler(closure)
                    .setImage(resource, for: state)
                return Disposables.create {
                    task.cancel()
                }
            } else {
                completionHandler?(nil, nil, .none, nil)
                observer.onCompleted()
                return Disposables.create()
            }
        })
    }
}

public typealias DownloadManagerTupleType = Image?
extension Kingfisher where Base: ChainCompatible,
Base.ChainType: ManagerChain {
    @discardableResult
    public func retrieveImage(with resource: Resource?) -> Observable<DownloadManagerTupleType> {
        return Observable.create({ (observer) -> Disposable in
            let chain = self.base.chain()
            let completionHandler = chain.completionHandler
            if let resource = resource {
                let closure = self._completionHandler(observer: observer, { (image, _, _, _) in
                    observer.onNext((image))
                })
                let task: RetrieveImageTask = self.completionHandler(closure)
                    .retrieveImage(resource)
                return Disposables.create {
                    task.cancel()
                }
            } else {
                completionHandler?(nil, nil, .none, nil)
                observer.onCompleted()
                return Disposables.create()
            }
        })
    }
}
extension Kingfisher where Base: ChainCompatible {
    func _completionHandler<T>(observer: AnyObserver<T>, _ onNext :@escaping CompletionHandler) -> CompletionHandler {
        let old = self.base.chain().completionHandler
        return { (image, error, cacheType, url) in
            if let error = error {
                observer.onError(error)
            }
            old?(image, error, cacheType, url)
            onNext(image, error, cacheType, url)
        }
    }
}
