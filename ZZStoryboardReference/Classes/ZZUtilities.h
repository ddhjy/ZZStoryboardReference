//
//  ZZUtilities.h
//  ZZStoryboardReference
//
//  Created by ddhjy on 29/9/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZUtilities : NSObject

/**
 Returns true if operation succeeded.
 */
FOUNDATION_EXPORT bool ZZSwizzleInstanceMethod(Class cls, SEL originalSelector, SEL swizzledSelector);

@end
