//
//  ZZStoryboardReference.h
//  ZZStoryboardReference
//
//  Created by ddhjy on 29/9/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ZZStoryboardReference.h"

/**
 Apple introduces storyboard reference from iOS 9, which provides a placeholder for scene in external storyboard. But due to the version limitation, it's not that usefull. What's more, it's not friendly for unit test, which rises the risk of refactoring. This class is a alternative of that.
 */
@interface ZZStoryboardReference : UIViewController

/**
 The stroyboard scene of this class should replace the content view with a label. The label's text would be the name of the referenced view controller.
 */
@property(null_resettable, nonatomic,strong) UILabel *view;

@end
