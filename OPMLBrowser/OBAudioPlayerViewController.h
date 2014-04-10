//
//  OBAudioPlayerViewController.h
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OBAudioItem;

@interface OBAudioPlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *playingImageView;
@property (weak, nonatomic) IBOutlet UILabel *playingLabel;

- (void)configureWithAudioItem:(OBAudioItem *)audioItem;

@end
