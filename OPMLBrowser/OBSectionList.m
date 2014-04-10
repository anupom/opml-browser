//
//  LBSectionList.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBJsonProperties.h"
#import "OBSectionList.h"

@implementation OBSectionList

- (void)initWithJson:(NSDictionary *)jsonAsDictionary
{
    _text = jsonAsDictionary[OBJsonPropertyText];
    
    self.items = [[NSMutableArray alloc] init];
    
    NSArray *results = jsonAsDictionary[OBJsonPropertyChildren];
    
    for (NSDictionary *dict in results)
    {
        if (dict[OBJsonPropertyType])
        {
            [super addToItems:dict];
        }
        // Ignore if does not have a type
    }
}

@end
