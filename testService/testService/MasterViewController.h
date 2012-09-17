//
//  MasterViewController.h
//  testService
//
//  Created by scottliyq on 12-9-17.
//  Copyright (c) 2012年 scottliyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
