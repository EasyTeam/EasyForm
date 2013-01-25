//
//  EFMoreCell.m
//  EasyForm
//
//  Created by Lei Sun on 1/25/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFMoreCell.h"

@implementation EFMoreCell

+(void)load
{
    [super registerClass:[self class] forCellTypeIdentifier:@"more"];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        sw=[[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        [sw addTarget:self action:@selector(swithVisible:) forControlEvents:UIControlEventValueChanged];
        
    }
    return self;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)layoutSubviews
{
    
    
    //self.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    //valueLabel.text=[self.cellDict objectForKey:@"value"];
    self.accessoryView=sw;
    [super layoutSubviews];
    
    
}
-(void)resizeFrame;
{
    
}

-(void)swithVisible:(UISwitch*)sw_
{
    
    
    [self.loader resetVisibleForGroupID:[[self.cellDict objectForKey:@"groupId"] intValue] value:sw_.isOn];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TB_RELOAD" object:nil];
}


@end
