//
//  OBJsonDeserializing.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OBJsonDeserializing <NSObject>

- (void)initWithJson:(NSDictionary *)jsonAsDictionary;

@end
