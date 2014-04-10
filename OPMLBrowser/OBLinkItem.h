//
//  OBLinkItem.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBJsonDeserializing.h"

@interface OBLinkItem : NSObject<OBJsonDeserializing>

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *url;

@end
