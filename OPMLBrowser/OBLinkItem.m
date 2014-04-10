//
//  OBLinkItem.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBJsonProperties.h"
#import "OBLinkItem.h"

@implementation OBLinkItem

- (void)initWithJson:(NSDictionary *)jsonAsDictionary
{
    _text = jsonAsDictionary[OBJsonPropertyText];
    _url = jsonAsDictionary[OBJsonPropertyUrl];
}

@end
