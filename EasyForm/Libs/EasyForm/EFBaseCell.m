//
//  EFBaseCell.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFBaseCell.h"
#import "EFCellFactory.h"

@implementation EFBaseCell


@synthesize cellDict;
@synthesize loader;

//@synthesize typeClassDict;



+(void)load
{
    
}
+(void)registerClass:(Class)cellClass forCellTypeIdentifier:(NSString *)identifier
{
    [[EFCellFactory sharedClass] registerCellType:cellClass forKey:identifier];
}

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
