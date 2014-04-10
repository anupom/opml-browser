//
//  OBAudioItem.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBAudioItem.h"
#import "OBJsonProperties.h"

@implementation OBAudioItem

- (void)initWithJson:(NSDictionary *)jsonAsDictionary
{
    _image = jsonAsDictionary[OBJsonPropertyImage];
    _playing = jsonAsDictionary[OBJsonPropertyPlaying];
    _playingImage = jsonAsDictionary[OBJsonPropertyPlayingImage];
    _subtext = jsonAsDictionary[OBJsonPropertySubtext];
    _text = jsonAsDictionary[OBJsonPropertyText];
    _url = jsonAsDictionary[OBJsonPropertyUrl];
}

@end
