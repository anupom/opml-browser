//
//  DetailViewController.h
//  TuneIn01
//
//  Created by Anupom Syam on 12/14/13.
//  Copyright (c) 2013 Anupom Syam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
