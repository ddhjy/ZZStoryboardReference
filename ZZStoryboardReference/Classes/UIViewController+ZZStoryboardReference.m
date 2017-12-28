//
//  UIViewController+ZZStoryboardRefrence.m
//  ZZStoryboardReference
//
//  Created by ddhjy on 29/9/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import "UIViewController+ZZStoryboardReference.h"

@implementation UIViewController (ZZStoryboardRefrence)

+ (instancetype)newFromStoryboard
{
    UIStoryboard *sb = self.storyboardName ? [UIStoryboard storyboardWithName:self.storyboardName bundle:nil] : nil;
    __kindof UIViewController *vc = [sb instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
    NSAssert(vc, @"Cannot find %@ in %@.storyboard", NSStringFromClass(self), self.storyboardName);
    return vc;
}

+ (NSString *)storyboardName
{
    return nil;
}

@end
