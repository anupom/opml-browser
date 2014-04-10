//
//  OBSectionList.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBBaseList.h"
#import "OBJsonDeserializing.h"

@interface OBSectionList : OBBaseList<OBJsonDeserializing>

@property (strong, nonatomic) NSString *text;

@end
