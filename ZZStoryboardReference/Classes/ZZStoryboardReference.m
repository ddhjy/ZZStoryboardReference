//
//  ZZStoryboardReference.m
//  ZZStoryboardReference
//
//  Created by ddhjy on 29/9/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import "ZZStoryboardReference.h"
#import "ZZUtilities.h"

@implementation ZZStoryboardReference
@dynamic view;

/**
 Defensive code. If user does not replace the content view with label in the storyboard scence, this operation will prevent the program from crashing.
 */
- (UILabel *)view {
    if (![super.view isKindOfClass:[UILabel class]]) {
        NSAssert(NO, @"The view should be replaced with a label.");
        return [UILabel new];
    }
    return (UILabel *)[super view];
}

@end


@implementation UIStoryboardSegue (ZZStoryboardReference)

+ (void)load
{
    ZZSwizzleInstanceMethod([UIStoryboardSegue class], @selector(initWithIdentifier:source:destination:), @selector(ZZ_InitWithIdentifier:source:destination:));
}

- (instancetype _Nonnull)ZZ_InitWithIdentifier:(NSString *_Nullable)identifier source:(UIViewController *_Nonnull)source destination:(UIViewController *_Nonnull)destination
{
    if ([destination isKindOfClass:[ZZStoryboardReference class]]) {
        NSString *referenceVCName = (((ZZStoryboardReference *)destination).view).text;
        Class aClass = NSClassFromString(referenceVCName);
        if (aClass) {
            destination = [aClass newFromStoryboard];
        } else {
            NSLog(@"ZZStoryboardReference: can not find %@", referenceVCName);
        }
    }
    
    return [self ZZ_InitWithIdentifier:identifier source:source destination:destination];
}

@end
