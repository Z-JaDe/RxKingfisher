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
public typealias ImageViewTupleType = (ImageView,Image?)
extension Kingfisher where Base: KingfisherOptionCompatible,
    Base.OptionInfoType:ViewOptionInfo<ImageView> {
    @discardableResult
    public func setImage(with resource:Resource?) -> Observable<ImageViewTupleType> {
        return Observable.create({ (observer) -> Disposable in
            return self.handle(resource: resource, observer: observer, callback: { (resource) -> RetrieveImageTask in
                let closure = self._completionHandler(observer: observer, {[weak self] (image, error, cacheType, url) in
                    guard let weakSelf = self else {return}
                    observer.onNext((weakSelf.base.optionInfo.view,image))
                })
                return self.completionHandler(closure).setImage(resource)
            })
        })
    }
}

public typealias ButtonTupleType = (Button,Image?,UIControlState)
extension Kingfisher where Base: KingfisherOptionCompatible,
    Base.OptionInfoType:ViewOptionInfo<Button> {
    @discardableResult
    public func setImage(with resource:Resource?, for state: UIControlState) -> Observable<ButtonTupleType> {
        return Observable.create({ (observer) -> Disposable in
            return self.handle(resource: resource, observer: observer, callback: { (resource) -> RetrieveImageTask in
                let closure = self._completionHandler(observer: observer, {[weak self] (image, error, cacheType, url) in
                    guard let weakSelf = self else {return}
                    observer.onNext((weakSelf.base.optionInfo.view, image,state))
                })
                return self.completionHandler(closure).setImage(resource, for: state)
            })
        })
    }
}

public typealias DownloadManagerTupleType = Image?
extension Kingfisher where Base: KingfisherOptionCompatible,
Base.OptionInfoType:ManagerOptionInfo {
    @discardableResult
    public func retrieveImage(with resource:Resource?) -> Observable<DownloadManagerTupleType> {
        return Observable.create({ (observer) -> Disposable in
            return self.handle(resource: resource, observer: observer, callback: { (resource) -> RetrieveImageTask in
                let closure = self._completionHandler(observer: observer, { (image, error, cacheType, url) in
                    observer.onNext((image))
                })
                return self.completionHandler(closure).retrieveImage(resource)
            })
        })
    }
}
extension Kingfisher where Base: KingfisherOptionCompatible {
    func handle<T>(resource:Resource?, observer:AnyObserver<T>, callback:(Resource)->RetrieveImageTask) -> Disposable {
        if let resource = resource {
            let task:RetrieveImageTask = callback(resource)
            return Disposables.create {
                task.cancel()
            }
        }else {
            let completionHandler = base.optionInfo.completionHandler
            completionHandler?(nil, nil, .none, nil)
            observer.onCompleted()
            return Disposables.create()
        }
    }
    func _completionHandler<T>(observer:AnyObserver<T>,_ onNext :@escaping CompletionHandler) -> CompletionHandler {
        let old = self.base.optionInfo.completionHandler
        return { (image, error, cacheType, url) in
            if let error = error {
                observer.onError(error)
            }
            old?(image,error,cacheType,url)
            onNext(image,error,cacheType,url)
            
        }
    }
}
