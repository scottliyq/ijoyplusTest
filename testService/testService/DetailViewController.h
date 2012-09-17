//
//  DetailViewController.h
//  testService
//
//  Created by scottliyq on 12-9-17.
//  Copyright (c) 2012年 scottliyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
