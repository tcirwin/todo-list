//
//  FUATableCell.h
//  TodoApp
//
//  Created by Therin Irwin on 10/15/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FUATodoItemDelegate.h"

@interface FUATableCell : UITableViewCell<UITextFieldDelegate>

@property (weak, nonatomic) id<FUATodoItemDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *edit;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
