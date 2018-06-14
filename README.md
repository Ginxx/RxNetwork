# RxNetwork

[![CI Status](http://img.shields.io/travis/G-Xi0N/RxNetwork.svg?style=flat)](https://travis-ci.org/G-Xi0N/RxNetwork)
[![Version](https://img.shields.io/cocoapods/v/RxNetwork.svg?style=flat)](http://cocoapods.org/pods/RxNetwork)
[![License](https://img.shields.io/cocoapods/l/RxNetwork.svg?style=flat)](http://cocoapods.org/pods/RxNetwork)
[![Platform](https://img.shields.io/cocoapods/p/RxNetwork.svg?style=flat)](http://cocoapods.org/pods/RxNetwork)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RxNetwork is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxNetwork'
```

## Usage

### Import

``` swift
import RxNetwork
```

### Configure

```swift
Network.default.timeoutInterval = 20
Network.default.plugins = [NetworkIndicatorPlugin()]
Network.default.taskClosure = { target in
    // configure common parameters etc.
    switch target.task {
    case let .requestParameters(parameters, encoding):
        let params: [String: Any] = ["token": "", "sign": "", "body": parameters]
        return .requestParameters(parameters: params, encoding: encoding)
    default:
        return target.task
    }
}
```

### Request with cache

```swift
/*
 {
    "top_stories": []
 }
 */
StoryAPI.latest
    .onCache(StoryListModel.self, { (response) in
        
    })
    .request()
    .subscribe(onSuccess: { (response) in
        
    })
    .disposed(by: disposeBag)
// or
/*
 {
    "code": 2000,
    "message": "Ok",
    "result": []
 }
 */
TestTarget.test(count: 10)
    .cache
    .request()
    .mapObject([TestModel].self)
    .subscribe(onNext: { (models) in
        
    })
    .disposed(by: disposeBag)
```

### Request without cache

```swift
TestTarget.test(count: 10)
    .request()
    .mapObject([TestModel].self)
    .subscribe(onSuccess: { (models) in
        
    }).disposed(by: disposeBag)
```

## Author

gaoX, gao497868860@163.com

## License

RxNetwork is available under the MIT license. See the LICENSE file for more info.
