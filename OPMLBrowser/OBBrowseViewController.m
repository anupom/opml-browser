//
//  OBBrowseViewController.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBActivityIndicator.h"
#import "OBBrowseViewController.h"
#import "OBApi.h"
#import "OBAudioItem.h"
#import "OBAudioPlayerViewController.h"
#import "OBLinkItem.h"
#import "OBMasterList.h"
#import "OBSectionList.h"

@interface OBBrowseViewController()

- (UITableViewCell *)getCellForTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;
- (void)reloadTableViewData;
- (void)startLoading;

@end

@implementation OBBrowseViewController
{
    OBApi *_opmlApi;
    OBMasterList *_list;
    OBActivityIndicator *_activityIndicator;
}

// Cell identifier constants
static NSString *const OBAudioCellIdentifier =  @"Cell.Audio";
static NSString *const OBLinkCellIdentifier =  @"Cell.Link";
// Segue identifier constants
static NSString *const OBShowBrowseSegueIdentifier =  @"ShowBrowse";
static NSString *const OBIShowPlayerSegueIdentifier =  @"ShowPlayer";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // TODO: We may not instantiate OBApi and OBActivityIndicator everytime
    // we can create them once in a DI container and update delegate/superView before use
    _opmlApi = [[OBApi alloc] initWithDelegate:self];
    _activityIndicator = [[OBActivityIndicator alloc] initWithSuperView:self.view];
 
    [self startLoading];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startLoading
{
    [_activityIndicator show];
    [_opmlApi load:_url];
}

- (void)reloadTableViewData {
    // Update table from the main thread
    dispatch_async(dispatch_get_main_queue(), ^(void)
    {
        [self.tableView reloadData];
    });
}

#pragma mark - OBApiResponseHandling

- (void)apiDidLoadWithList:(OBMasterList *)list
{
    _list = list;
    self.navigationItem.title = _list.title;
    [_activityIndicator hide];
    [self reloadTableViewData];
}

- (void)apiDidFailWithError:(NSError *)error
{
    // TODO: Show error alert
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_list getNumberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_list getNumberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [_list getItemAtSection:indexPath.section atIndex:indexPath.row];
    
    UITableViewCell *cell;
    
    if ([item isKindOfClass:[OBLinkItem class]])
    {
        OBLinkItem *linkItem = item;
        cell = [self getCellForTableView:tableView withIdentifier:OBLinkCellIdentifier];
        cell.textLabel.text = linkItem.text;
    }
    // Otherwise it's an AudioItem
    else
    {
        OBAudioItem *audioItem = item;
        cell = [self getCellForTableView:tableView withIdentifier:OBAudioCellIdentifier];
        cell.textLabel.text = audioItem.text;
        cell.detailTextLabel.text = audioItem.subtext;
    }

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_list getTitleForSection:section];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:OBShowBrowseSegueIdentifier])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        // Must be a link item, audio item does not use this segue id
        OBLinkItem *linkItem = [_list getItemAtSection:indexPath.section atIndex:indexPath.row];
        [[segue destinationViewController] setUrl:linkItem.url];
    }
    else if([[segue identifier] isEqualToString:OBIShowPlayerSegueIdentifier])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // Must be an audio item, link item does not use this segue id
        OBAudioItem *audioItem = [_list getItemAtSection:indexPath.section atIndex:indexPath.row];
        [[segue destinationViewController] configureWithAudioItem:audioItem];
    }
}

// Helper method to create/reuse a table view cell
- (UITableViewCell *)getCellForTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    return cell;
}

@end
