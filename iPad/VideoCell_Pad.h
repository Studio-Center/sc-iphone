//
//  VideoCell_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 30.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"
#import "BaseCell.h"
#import "AsynchronousImageView.h"

@interface VideoCell_Pad : BaseCell {
	UILabel *leftTileLabel;
	UILabel *rightTitleLabel;
	
	UILabel *leftMiddleLabel;
	UILabel *rightMiddleLabel;
	
	UILabel *leftBottomLabel;
	UILabel *rightBottomLabel;
	
	Video *firstVideo;
	Video *secondVideo;
	
	UIButton *fav1;
	UIButton *fav2;
	
	UIButton *playButton1;
	UIButton *playButton2;
	
	AsynchronousImageView *image1;
	AsynchronousImageView *image2;
}
@property (nonatomic, retain) IBOutlet AsynchronousImageView *image1, *image2;
@property (nonatomic, retain) IBOutlet UIButton *playButton1, *playButton2;
@property (nonatomic, retain) IBOutlet UIButton *fav1, *fav2;
@property (nonatomic, retain) IBOutlet UILabel *leftTileLabel;
@property (nonatomic, retain) IBOutlet UILabel *rightTitleLabel;
@property (nonatomic, retain) IBOutlet UILabel *leftMiddleLabel;
@property (nonatomic, retain) IBOutlet UILabel *rightMiddleLabel;
@property (nonatomic, retain) IBOutlet UILabel *leftBottomLabel;
@property (nonatomic, retain) IBOutlet UILabel *rightBottomLabel;

-(IBAction)favoriteFirst;
-(IBAction)favoriteSecond;

-(IBAction)selectFirst;
-(IBAction)selectSecond;
@end
