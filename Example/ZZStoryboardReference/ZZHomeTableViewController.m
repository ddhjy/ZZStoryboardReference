//
//  ZZHomeTableViewController.m
//  ZZStoryboardReference_Example
//
//  Created by ddhjy on 28/12/2017.
//  Copyright © 2017 ddhjy. All rights reserved.
//

#import "ZZHomeTableViewController.h"
#import "ZZStoryboardReference.h"
#import "ZZRedViewController.h"
#import "ZZBlueViewController.h"

typedef NS_ENUM(NSUInteger, ZZHomeTableViewSection) {
    ZZHomeTableViewSectionSeguePush = 0,
    ZZHomeTableViewSectionHardCodePush
};

@interface ZZHomeTableViewController ()
@end

@implementation ZZHomeTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == ZZHomeTableViewSectionHardCodePush) {
        switch (indexPath.row) {
            case 0:
                [self.navigationController pushViewController:[ZZRedViewController newFromStoryboard] animated:YES];
                break;
            case 1:
                [self.navigationController pushViewController:[ZZBlueViewController newFromStoryboard] animated:YES];
                break;
        }
    }
}

@end

