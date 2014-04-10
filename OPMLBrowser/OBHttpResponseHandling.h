//
//  OBHttpResponseHandling.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OBHttpResponseHandling <NSObject>

- (void)httpDidLoadWithData:(NSData *)data;
- (void)httpDidFailWithError:(NSError *)error;

@end
