//
//  OBHttp.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBHttp.h"
#import "OBHttpResponseHandling.h"

@implementation OBHttp

- (id)initWithDelegate:(id<OBHttpResponseHandling>)delegate
{
    if (self = [super init])
    {
        _delegate = delegate;
    }
    
    return self;
}

- (void)sendAsyncRequest:(NSString *)urlAsString
{
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    [NSURLConnection
     sendAsynchronousRequest:[[NSURLRequest alloc]initWithURL:url]
     queue:[[NSOperationQueue alloc] init]
     completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if (error)
        {
            [self.delegate httpDidFailWithError:error];
        }
        else
        {
            [self.delegate httpDidLoadWithData:data];
        }
    }];   
}

@end
