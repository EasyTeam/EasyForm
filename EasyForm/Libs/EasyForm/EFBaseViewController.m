//
//  EFBaseViewController.m
//  EasyForm
//
//  Created by Lei Sun on 1/11/13.
//  Copyright (c) 2013 EasyTeam. All rights reserved.
//

#import "EFBaseViewController.h"
#import "EFBaseCell.h"
#import "EFCellFactory.h"

@interface EFBaseViewController ()
@property(nonatomic,retain)NSMutableDictionary* styleDict;
@property(nonatomic,retain) NSString* styleFilePath;
@property(nonatomic,retain)EFPlistLoader* loader;

@end

@implementation EFBaseViewController

@synthesize dataDict;
@synthesize styleDict;
@synthesize styleFilePath;
@synthesize loader;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
        self.tableView.backgroundColor=[UIColor whiteColor];
        self.tableView.backgroundView=nil;
    }
    return self;
}

- (id)initWithPlistFile:(NSString*)fileName
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        NSLog(@"%@",[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]);
        
        self.styleFilePath=[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loader=[[[EFPlistLoader alloc] initWithFileName:self.styleFilePath] autorelease];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableReload) name:@"TB_RELOAD" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.loader numbersOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
   return [self.loader numbersOfRowsInSection:section];}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary* dict=[self.loader cellDictForRow:indexPath.row inSection:indexPath.section];
    
    
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"FEBaseCell_%@",[dict objectForKey:@"id"]];
    // FEBaseCell *cell = nil;
    
    EFBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //FEBaseCell *cell =nil;
    if (cell==nil) {
        Class cls=[[EFCellFactory sharedClass] classForCellTypeName: [dict objectForKey:@"type"]];
        cell=[[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.loader=self.loader;
    }
    cell.cellDict=dict;
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

-(void)tableReload
{
    [self.tableView reloadData];
}
@end
