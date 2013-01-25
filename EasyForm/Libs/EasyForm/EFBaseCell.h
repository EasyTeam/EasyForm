//
//  EFBaseCell.h
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFPlistLoader.h"

UIKIT_EXTERN NSString *const FECellValueWillChangeNotification;
UIKIT_EXTERN NSString *const FECellValueDidChangeNotification;


typedef enum _CellType
{
    CellTypeLabel,
    CellTypeText,
    CellTypeButton,
    CellTypeSwith,
    
}CellType;

typedef enum _CellSubType
{
    CellTypeMail,
    CellTypeIDCard,
    CellTypeDate,
    CellTypePickArray,
    
}CellSubType;


@interface EFBaseCell : UITableViewCell

@property(nonatomic,retain) EFPlistLoader* loader;
@property(nonatomic,retain)NSMutableDictionary* cellDict;
//-(id)initWithDict:(NSMutableDictionary*)dict;
+(void)registerClass:(Class)cellClass forCellTypeIdentifier:(NSString *)identifier;
//+(FEBaseCell*)factoryCreate;
@end
