//
//  OBHttp.h
//  OPMLBrowser
//
//  Provides methods to send aynchrnous http requests
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  OBHttpResponseHandling;

@interface OBHttp : NSObject

@property (weak, nonatomic) id<OBHttpResponseHandling> delegate;

- (id)initWithDelegate:(id<OBHttpResponseHandling>)delegate;
- (void)sendAsyncRequest:(NSString *)urlAsString;

@end
