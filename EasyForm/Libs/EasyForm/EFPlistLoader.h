//
//  EFPlistLoader.h
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EFPlistLoader : NSObject{
    
    NSMutableDictionary* plistDict;
    //NSMutableDictionary* plistVisibleDict;
}
+(id)loaderWithFileName:(NSString*)fileName;
-(id)initWithFileName:(NSString*)fileName;

-(NSString*)tableName;
-(BOOL)enablePullToReload;
-(NSInteger)numbersOfSection;

-(NSString*)headerTextForSection:(NSInteger)section;
-(NSString*)footerTextForSection:(NSInteger)section;
-(NSInteger)numbersOfRowsInSection:(NSInteger)section;
-(NSMutableDictionary*)cellDictForRow:(NSInteger)row  inSection:(NSInteger)section;

-(void)resetVisibleForGroupID:(NSInteger)groupID value:(BOOL)isOn;
@end
