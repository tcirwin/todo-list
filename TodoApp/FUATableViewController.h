//
//  FUATableViewController.h
//  TodoApp
//
//  Created by Therin Irwin on 10/15/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FUATodoItemDelegate.h"

@interface FUATableViewController : UITableViewController<FUATodoItemDelegate>
    
- (IBAction)onTap:(id)sender;
- (BOOL)saveTodoItems;

@end
