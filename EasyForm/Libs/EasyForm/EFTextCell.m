//
//  EFTextCell.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFTextCell.h"

@implementation EFTextCell


+(void)load
{
    [super registerClass:[self class] forCellTypeIdentifier:@"text"];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self loadView];
    }
    return self;
}

-(void)loadView;
{
    textField=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
    textField.borderStyle=UITextBorderStyleLine;
    textField.backgroundColor=[UIColor clearColor];
    textField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textField.delegate=(id<UITextFieldDelegate>)self;
}

-(void)layoutSubviews
{
    
    
    //self.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    textField.text=[self.cellDict objectForKey:@"value"];
    textField.placeholder=[self.cellDict objectForKey:@"mask"];
    self.accessoryView=textField;
    
    [super layoutSubviews];
    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    
    NSString* willText=  [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (willText.length<=[[self.cellDict objectForKey:@"maxLength"] intValue]) {
        return YES;
    }else
    {
        return NO;
      
    }
}

@end
