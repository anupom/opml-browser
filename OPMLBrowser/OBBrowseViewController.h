//
//  OBBrowseViewController.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBApiResponseHandling.h"

@interface OBBrowseViewController : UITableViewController<OBApiResponseHandling>

// To be set when browsed through a link
@property (strong, nonatomic) NSString *url;

@end
