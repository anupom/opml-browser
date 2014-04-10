//
//  OBBaseList.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBAudioItem.h"
#import "OBBaseList.h"
#import "OBJsonProperties.h"
#import "OBLinkItem.h"

@implementation OBBaseList

- (void)addToItems:(NSDictionary *)dict
{
    if ([dict[OBJsonPropertyType] isEqualToString:(OBJsonPropertyLink)])
    {
        OBLinkItem *linkItem = [[OBLinkItem alloc] init];
        [linkItem initWithJson:dict];
        [_items addObject:linkItem];
    }
    else if ([dict[OBJsonPropertyType] isEqualToString:(OBJsonPropertyAudio)])
    {
        OBAudioItem *audioItem = [[OBAudioItem alloc] init];
        [audioItem initWithJson:dict];
        [_items addObject:audioItem];
    }
    
    // Ignore if type is not link or audio
}

@end
