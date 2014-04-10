//
//  OBAudioItem.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBJsonDeserializing.h"

@interface OBAudioItem : NSObject<OBJsonDeserializing>

@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *playing;
@property (strong, nonatomic) NSString *playingImage;
@property (strong, nonatomic) NSString *subtext;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *url;

@end
