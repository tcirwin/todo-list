//
//  FUATableCell.m
//  TodoApp
//
//  Created by Therin Irwin on 10/15/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import "FUATableCell.h"

@implementation FUATableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)awakeFromNib
{
    static int nibTag = 0;
    
    _textField.delegate = self;
    self.shouldIndentWhileEditing = NO;
    
    self.tag = nibTag;
    nibTag++;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - Text field delegate

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    [self.delegate editTodoItemAtCell:self withText:textField.text];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    textField.selectedTextRange = [textField textRangeFromPosition:[textField beginningOfDocument] toPosition:[textField endOfDocument]];
}

@end
