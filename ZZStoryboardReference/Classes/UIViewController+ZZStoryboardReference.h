//
//  UIViewController+ZZStoryboardRefrence.h
//  ZZStoryboardReference
//
//  Created by ddhjy on 29/9/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 In general, the storyboardName method of the view controller does't return nil, which means that the view controller can instantiate from corresponding storyboard. But when the view controller conforms to this protocol, it does't need instantiating whether its storyboardName method returns nil. This protocol is mainly supportting the unit test.
 
 @discussion Assuming that there are three view controllers: A, B and C. B and C are subclasses of A. The A does't have storyboard scene, the B and C's storyboard scenes are in the same storyboard, so we can just override A's storyboardName method. So now every thing is ok except that the A's storybaord method does't return nil but A doesn't  have corresponding storyboard. For this situation, we just make A conform to this protocol.
 */
@protocol ZZInstantiateFromStoryboardDisable
@end

/**
 A convinient way to instantiate view controller from storyboard. With this mechanism, unit test for storyboard scene become easy.
 */
@interface UIViewController (ZZStoryboardReference)

/**
 Instantiate current view controller from corresponding storyboard.
 */
+ (nullable instancetype)newFromStoryboard;

/**
 Returns the the storyboard's name which can instantiate current view controller. The view controller which relays on newFromStoryboard must override this method.
 */
+ (nullable NSString *)storyboardName;

@end
