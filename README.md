# RxKingfisher

[![CI Status](https://travis-ci.org/Z-JaDe/RxKingfisher.svg?branch=master)](https://travis-ci.org/Z-JaDe/RxKingfisher)
![CocoaPods compatible](https://img.shields.io/badge/CocoaPods-compatible-4BC51D.svg?style=flat)
![Swift version](https://img.shields.io/badge/swift-5.0-orange.svg)

不支持Kingfisher5.0以后的了，懒的搞也没必要。

Kingfisher的一些扩展
```swift

self.iconImageView.kf
.placeholder(R.image.ic_missing()!)
.setImage(model.coin_icon)

```

```swift

self.iconImageView.kf
.forceRefresh()
.backgroundDecode()
.transition(.fade(2))
.placeholder(R.image.ic_missing()!)
.setImage(model.coin_icon)

```
RxSwift支持

```swift

self.iconImageView.kf
.placeholder(R.image.ic_钱包_coin_missing()!)
.setImage(with: model.coin_icon)
.subscribeOnNext { (imageView,image) in
// TODO: setImage方法也可以返回一个信号，这样可以对下载好的图片进行一些处理，比如圆角 切割
}.disposed(by: self.disposeBag)

```
