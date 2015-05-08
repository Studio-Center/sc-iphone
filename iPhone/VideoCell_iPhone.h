//
//  VideoCell_iPhone.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 Dimalex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
@class Video;
@class ASIHTTPRequest;
@interface VideoCell_iPhone : BaseCell {
	UIButton *playButton;
	ASIHTTPRequest *loadImage;
}
@property (nonatomic, retain) IBOutlet UIButton *playButton;
- (IBAction)play:(id)sender;	
- (IBAction)accessoryClick:(UIButton*)sender;
@end
