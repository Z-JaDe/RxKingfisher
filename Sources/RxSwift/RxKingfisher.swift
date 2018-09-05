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
extension Kingfisher where Base: KingfisherOptionInfoProtocol,
Base.ViewType:ImageView {
    typealias ImageViewTupleType = (ImageView,Image?)
    func setImage(with resource:Resource?) -> Observable<ImageViewTupleType> {
        let optionsInfo = base.optionsInfo
        return Observable.create({ (observer) -> Disposable in
            let completionHandler = optionsInfo.completionHandler
            let task:RetrieveImageTask = self.completionHandler({[weak self] (image, error, cacheType, url) in
                guard let weakSelf = self else {
                    completionHandler?(image,error,cacheType,url)
                    observer.onCompleted()
                    return
                }
                completionHandler?(image,error,cacheType,url)
                observer.onNext((weakSelf.base.view,image))
                observer.onCompleted()
            }).setImage(with: resource)
            return Disposables.create {
                task.cancel()
            }
        })
    }
}

extension Kingfisher where Base: KingfisherOptionInfoProtocol,
Base.ViewType:Button {
    typealias ButtonTupleType = (Button,Image?,UIControlState)
    func setImage(with resource:Resource?, for state: UIControlState) -> Observable<ButtonTupleType> {
        let optionsInfo = base.optionsInfo
        return Observable.create({ (observer) -> Disposable in
            let completionHandler = optionsInfo.completionHandler
            let task:RetrieveImageTask = self.completionHandler({[weak self] (image, error, cacheType, url) in
                guard let weakSelf = self else {
                    completionHandler?(image,error,cacheType,url)
                    observer.onCompleted()
                    return
                }
                completionHandler?(image,error,cacheType,url)
                observer.onNext((weakSelf.base.view,image,state))
                observer.onCompleted()
            }).setImage(with: resource, for: state)
            return Disposables.create {
                task.cancel()
            }
        })
    }
}
