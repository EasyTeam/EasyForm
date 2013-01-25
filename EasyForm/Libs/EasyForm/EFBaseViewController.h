//
//  EFBaseViewController.h
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFPlistLoader.h"

@interface EFBaseViewController : UITableViewController{
    
    NSMutableDictionary* dataDict;
    NSString* styleFilePath;    
    EFPlistLoader* loader;
    //NSMutableDictionary* valueDict;
}
- (id)initWithPlistFile:(NSString*)fileName;
@property(nonatomic,retain)NSMutableDictionary* dataDict;
@end
