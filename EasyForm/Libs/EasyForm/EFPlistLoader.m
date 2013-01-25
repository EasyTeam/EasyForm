//
//  EFPlistLoader.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFPlistLoader.h"

@implementation EFPlistLoader

+(id)loaderWithFileName:(NSString*)fileName
{
    return [[[self alloc] initWithFileName:fileName] autorelease];
}
-(id)initWithFileName:(NSString*)fileName
{
    self=[super init];
    if (self) {
        plistDict=[[NSMutableDictionary alloc] initWithContentsOfFile:fileName];
    }
    return self;
}

-(NSString*)tableName
{
    return [plistDict objectForKey:@"tableName"];
}
-(BOOL)enablePullToReload
{
    return NO;
}
-(NSInteger)numbersOfSection
{
    return [[plistDict objectForKey:@"sections"] count];
}

-(NSString*)headerTextForSection:(NSInteger)section
{
    return [[[plistDict objectForKey:@"sections"] objectAtIndex:section] objectForKey:@"headerText"];
}
-(NSString*)footerTextForSection:(NSInteger)section
{
    return [[[plistDict objectForKey:@"sections"] objectAtIndex:section] objectForKey:@"footerText"];
}
-(NSInteger)numbersOfRowsInSection:(NSInteger)section
{
    
    int retCount=0;
    for (NSMutableDictionary* dict in [[[plistDict objectForKey:@"sections"] objectAtIndex:section] objectForKey:@"cells"]) {
        if ([[dict objectForKey:@"visible"] boolValue]) {
            retCount++;
        }
    }
    return retCount;
    
    
    //return [[[[plistDict objectForKey:@"sections"] objectAtIndex:section] objectForKey:@"cells"] count];
}
-(NSMutableDictionary*)cellDictForRow:(NSInteger)row  inSection:(NSInteger)section
{
    
    NSMutableDictionary* retDict=[[self visiblePlistDictInSection:section] objectAtIndex:row];;
    //    [dict setObject:@"aaaa" forKey:@"title"];
    //    [dict setObject:@"bbbb" forKey:@"value"];
    //    if (section%2==0) {
    //        [dict setObject:@"label" forKey:@"type"];
    //    }else{
    //        [dict setObject:@"text" forKey:@"type"];
    //    }
    
    return retDict;
    
}
- (void)dealloc
{
    [plistDict release];
    [super dealloc];
}
-(NSMutableArray*)visiblePlistDictInSection:(NSInteger)section
{
    NSMutableArray* retArray=[NSMutableArray array];
    for (NSMutableDictionary* dict in [[[plistDict objectForKey:@"sections"] objectAtIndex:section] objectForKey:@"cells"]) {
        if ([[dict objectForKey:@"visible"] boolValue]) {
            [retArray addObject:dict];
        }
    }
    return retArray;
    
}
-(void)resetVisibleForGroupID:(NSInteger)groupID value:(BOOL)isOn;
{
    
    if (groupID==0) {
        return;
    }
    for (NSMutableDictionary* dict1 in [plistDict objectForKey:@"sections"]) {
        for (NSMutableDictionary* dict2 in [dict1  objectForKey:@"cells"]) {
            if (![[dict2 objectForKey:@"type"] isEqualToString:@"more"]&&[[dict2 objectForKey:@"groupId"] intValue]==groupID) {
                [dict2 setObject:[NSNumber numberWithBool:isOn] forKey:@"visible"];
            }
        }
    }
    
    
    
}
@end
