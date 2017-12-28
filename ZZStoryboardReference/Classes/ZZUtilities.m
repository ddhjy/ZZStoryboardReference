//
//  ZZUtilities.m
//  ZZStoryboardReference
//
//  Created by ddhjy on 29/9/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import "ZZUtilities.h"
#import <objc/runtime.h>

@implementation ZZUtilities

bool ZZSwizzleInstanceMethod(Class cls, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    if (!originalMethod) {
        NSLog(@"ZZSwizzle fail: Original method %@ not found for class %@.", NSStringFromSelector(originalSelector), cls);
        return false;
    }
    
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    if (!swizzledMethod) {
        NSLog(@"ZZSwizzle fail: Swizzled method %@ not found for class %@.", NSStringFromSelector(originalSelector), cls);
        return false;
    }
    
    BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    return true;
}

@end
