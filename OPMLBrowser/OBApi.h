//
//  OBApi.h
//  OPMLBrowser
//
//  Facade class to interact with OPML API
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBHttpResponseHandling.h"

@protocol OBApiResponseHandling;

@interface OBApi : NSObject<OBHttpResponseHandling>

@property (weak, nonatomic) id<OBApiResponseHandling> delegate;

- (id)initWithDelegate:(id<OBApiResponseHandling>)delegate;
- (void)load;
- (void)load:(NSString *)url;

@end