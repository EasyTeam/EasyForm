//
//  EFBaseCell.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFBaseCell.h"

@implementation EFBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
