//
//  OBMasterList.h
//  OPMLBrowser
//
//  Object representation of a json document produced by OPML API
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBBaseList.h"
#import "OBJsonDeserializing.h"

@interface OBMasterList : OBBaseList<OBJsonDeserializing>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *sections;

- (NSInteger)getNumberOfSections;
- (NSInteger)getNumberOfItemsInSection:(NSInteger)section;
- (id)getItemAtSection:(NSInteger)section atIndex:(NSUInteger)index;
- (NSString *)getTitleForSection:(NSInteger)section;

@end
