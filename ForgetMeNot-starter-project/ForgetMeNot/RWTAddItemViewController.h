//
//  RWTAddItemViewController.h
//  ForgetMeNot
//
//  Created by Henry Dinhofer on 6/28/16.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RWTItem;

typedef void(^RWTItemAddedCompletion)(RWTItem *newItem);

@interface RWTAddItemViewController : UITableViewController

@property (nonatomic, copy) RWTItemAddedCompletion itemAddedCompletion;

@end
