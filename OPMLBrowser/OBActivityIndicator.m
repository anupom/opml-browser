//
//  OBActivityIndicator.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/15/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBActivityIndicator.h"

@implementation OBActivityIndicator
{
    UIView *_superView;
}

// Center at x = 1/2 width and y = 1/3 height
static CGFloat const OBWidthMultiplier =  1.0f/2.0f;
static CGFloat const OBHeightMultiplier =  1.0f/3.0f;

- (id)initWithSuperView:(UIView *)superView
{
    if (self = [super initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray])
    {
        _superView = superView;
        
        self.center = CGPointMake(_superView.frame.size.width * OBWidthMultiplier,
                                  _superView.frame.size.height * OBHeightMultiplier);
        [self hidesWhenStopped];
    }
    
    return self;
}

- (void)show
{
    [_superView addSubview: self];
    [self startAnimating];
}

- (void)hide
{
    [self stopAnimating];
    [self removeFromSuperview];
}

@end