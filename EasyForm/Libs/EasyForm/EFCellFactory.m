//
//  EFCellFactory.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFCellFactory.h"

static EFCellFactory* _sharedFECellFactoryInstance;

@interface EFCellFactory ()
@property(nonatomic,retain)NSMutableDictionary *typeClassDict;
@end

@implementation EFCellFactory
@synthesize typeClassDict;
+(EFCellFactory*)sharedClass
{
    
    if (_sharedFECellFactoryInstance==nil) {
        _sharedFECellFactoryInstance=[[EFCellFactory alloc] init];
    }
    return  _sharedFECellFactoryInstance;
    
}
- (id)init
{
    self = [super init];
    if (self) {
        _sharedFECellFactoryInstance=self;
        self.typeClassDict=[NSMutableDictionary dictionary];
    }
    return self;
}
-(void)registerCellType:(Class)class forKey:(NSString*)key;
{
    [self.typeClassDict setObject:class forKey:key];
    
}
-(Class)classForCellTypeName:(NSString*)key;
{
    Class cls=[self.typeClassDict objectForKey:key];
    return cls?cls: [EFBaseCell class];
}
@end
