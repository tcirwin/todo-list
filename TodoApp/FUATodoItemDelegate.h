//
//  FUATodoItemDelegate.h
//  TodoApp
//
//  Created by Therin Irwin on 10/15/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FUATodoItemDelegate <NSObject>

- (void)editTodoItemAtCell:(UITableViewCell *)tableCell withText:(NSString*)text;

@end
