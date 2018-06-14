# ZZStoryboardReference

[![CI Status](http://img.shields.io/travis/ddhjy/ZZStoryboardReference.svg?style=flat)](https://travis-ci.org/ddhjy/ZZStoryboardReference)
[![Version](https://img.shields.io/cocoapods/v/ZZStoryboardReference.svg?style=flat)](http://cocoapods.org/pods/ZZStoryboardReference)
[![License](https://img.shields.io/cocoapods/l/ZZStoryboardReference.svg?style=flat)](http://cocoapods.org/pods/ZZStoryboardReference)
[![Platform](https://img.shields.io/cocoapods/p/ZZStoryboardReference.svg?style=flat)](http://cocoapods.org/pods/ZZStoryboardReference)

Apple introduces storyboard reference from iOS 9, which provides a placeholder for scene in external storyboard. But due to the version limitation, it's not that practical. What's more, it's not friendly to unit test, which rises the risk of refactoring. ZZStoryboardReference is a alternative of that.

You just need  dragging a view controller(called A) scene to the storyboarad, set its class to ZZStoryboardReference, replace the content  view with a label, then  set the label's text to another view controller's (called B) name which can instantiate from storyboard. (I recommend copying the sence in the demo  and modify the label's text) Now A is a place holder of B, We can link segue to A when it's not  convenient for B. In addition, B should override the storyboardName method as the demo shows.

If you want to instantiate view controller from stroyboard with code:
```objective-c
ZZRedViewController *redVC = [ZZRedViewController newFromStoryboard];
[self.navigationController pushViewController:redVC animated:YES];
```

What's more, this mechanism makes unit test for storyboard scene easy. I write a unit test in the demo, when we move a scene for a storyboard to another and forget modifing the storyboardName method, the unit test would rise a exception.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

[![Watch the video](https://github.com/ddhjy/ZZStoryboardReference/blob/master/Snapshots/operation_guide_placeholder.png)](https://youtu.be/y3Cu7-iZXJo)

## Requirements

## Installation

ZZStoryboardReference is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZZStoryboardReference'
```

## Author

ddhjy, 510893492@qq.com

## License

ZZStoryboardReference is available under the MIT license. See the LICENSE file for more info.
