//
//  OBApi.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBApi.h"
#import "OBApiResponseHandling.h"
#import "OBHttp.h"
#import "OBMasterList.h"

@implementation OBApi
{
    OBHttp *_http;
}

static NSString *const OBDefaultUrl = @"http://opml.radiotime.com/?render=json";
static NSString *const OBJsonSuffix = @"render=json";

- (id)initWithDelegate:(id<OBApiResponseHandling>)delegate
{
    if (self = [super init])
    {
        _delegate = delegate;
        _http = [[OBHttp alloc] initWithDelegate:self];
    }
    
    return self;
}

- (void)load
{
    [self load:OBDefaultUrl];
}

- (void)load:(NSString *)url
{
    // If url is nil we fallback to default url
    if (!url)
    {
        url = OBDefaultUrl;
    }
    
    // Loose check to see if json suffix is present
    // Assumed it will be either at the end part of the string or not present
    if (![url hasSuffix:OBJsonSuffix])
    {
        url = [NSString stringWithFormat:@"%@&%@", url, OBJsonSuffix];
    }
    
    [_http sendAsyncRequest:(url)];
}

#pragma mark - OBHttpResponseHandling

- (void)httpDidLoadWithData:(NSData *)data
{
    NSError *error = nil;
    NSDictionary *parsedObject = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:NSJSONReadingMutableContainers
                                  error:&error];

    if (error != nil)
    {
        [_delegate apiDidFailWithError:error];
        return;
    }
    
    OBMasterList *list = [[OBMasterList alloc] init];
    [list initWithJson:parsedObject];
    [_delegate apiDidLoadWithList:list];
}

- (void)httpDidFailWithError:(NSError *)error;
{
    [_delegate apiDidFailWithError:error];
}
@end