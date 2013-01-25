//
//  EFCellFactory.h
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFBaseCell.h"

@interface EFCellFactory : NSObject
{
    NSMutableDictionary* typeClassDict;
}
+(EFCellFactory*)sharedClass;
-(void)registerCellType:(Class)class forKey:(NSString*)key;
-(Class)classForCellTypeName:(NSString*)key;
@end