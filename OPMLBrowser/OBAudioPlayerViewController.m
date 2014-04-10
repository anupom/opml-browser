//
//  OBAudioPlayerViewController.m
//  OPMLBrowser
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import "OBActivityIndicator.h"
#import "OBAudioItem.h"
#import "OBAudioPlayerViewController.h"

@interface OBAudioPlayerViewController()

- (void)loadAndSetImage;

@end

@implementation OBAudioPlayerViewController
{
    OBActivityIndicator *_activityIndicator;
    
    NSString *_audioUrl;
    NSString *_imageUrl;
    NSString *_text;
    NSString *_header;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _playingLabel.text = _text;
    self.navigationItem.title = _header;
    _activityIndicator = [[OBActivityIndicator alloc] initWithSuperView:self.view];
    [_activityIndicator show];
    [self loadAndSetImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureWithAudioItem:(OBAudioItem *)audioItem
{
    _header = audioItem.text;
    
    _text = audioItem.playing;
    if (!_text)
    {
        _text = audioItem.text;
    }

    _imageUrl = audioItem.playingImage;
    if(!_imageUrl)
    {
        _imageUrl = audioItem.image;
    }

    _audioUrl = audioItem.url;
}

- (void)loadAndSetImage
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
    {
        NSURL *url = [NSURL URLWithString:_imageUrl];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^(void)
        {
            [_playingImageView setImage:image];
            [_activityIndicator hide];
        });
    });
}
@end
