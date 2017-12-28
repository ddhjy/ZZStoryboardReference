//
//  ZZStroyboardSceneTests.m
//  ZZStoryboardReference_Tests
//
//  Created by ddhjy on 28/12/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>
#import <ZZStoryboardReference/ZZStoryboardReference.h>

@interface ZZStroyboardSceneTests : XCTestCase
@end

@implementation ZZStroyboardSceneTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_ViewControllerWithStoryboardNameReturnsNotNil_HasSceneInCorrespondingStoryboard {
    NSMutableArray *clasNames = [self currentAppClassNames];
    NSArray<NSString *> *ignoredClassNames = [self ignoredClassNames];
    
    for (NSString *className in clasNames) {
        if ([ignoredClassNames containsObject:className]) continue;
        
        Class class = NSClassFromString(className);
        if (class_conformsToProtocol(class, @protocol(ZZInstantiateFromStoryboardDisable))) continue;

        if ([class respondsToSelector:@selector(storyboardName)] && [class storyboardName]) {
            UIViewController *instanceVC = [class newFromStoryboard];
            XCTAssertTrue(instanceVC && [instanceVC isKindOfClass:class]);
        }
    }
}

- (NSArray<NSString *> *)ignoredClassNames {
    return @[];
}

- (NSMutableArray *)currentAppClassNames {
    NSMutableArray *classNameStrings = [NSMutableArray array];
    unsigned int classNamesCount = 0;
    const char **classNames = objc_copyClassNamesForImage([[NSBundle mainBundle].executablePath UTF8String], &classNamesCount);
    if (classNames) {
        for (unsigned int i = 0; i < classNamesCount; i++) {
            const char *className = classNames[i];
            NSString *classNameString = [NSString stringWithUTF8String:className];
            [classNameStrings addObject:classNameString];
        }
        free(classNames);
        classNameStrings = [classNameStrings sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)].mutableCopy;
    }
    return classNameStrings;
}

@end

