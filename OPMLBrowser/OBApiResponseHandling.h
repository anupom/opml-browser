//
//  OBApiResponseHandling.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OBMasterList;

@protocol OBApiResponseHandling <NSObject>

- (void)apiDidLoadWithList:(OBMasterList *)list;
- (void)apiDidFailWithError:(NSError *)error;

@end
