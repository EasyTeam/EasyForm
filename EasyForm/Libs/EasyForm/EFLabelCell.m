//
//  EFLabelCell.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFLabelCell.h"

@implementation EFLabelCell

+(void)load
{
    [super registerClass:[self class] forCellTypeIdentifier:@"label"];
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
        valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        valueLabel.backgroundColor=[UIColor clearColor];
        valueLabel.textAlignment=NSTextAlignmentLeft;
    }
    return self;
}


-(void)layoutSubviews
{
    
    
    //self.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    valueLabel.text=[self.cellDict objectForKey:@"value"];
    self.accessoryView=valueLabel;
    
    [super layoutSubviews];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
