//
//  OBBaseList.h
//  OPMLBrowser
//
//  Abstract list, should not be instantiated
//  Provides common list methods
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBBaseList : NSObject

// Items array can hold AudioItem or LinkItem
@property (strong, nonatomic) NSMutableArray *items;

- (void)addToItems:(NSDictionary *)dict;

@end
