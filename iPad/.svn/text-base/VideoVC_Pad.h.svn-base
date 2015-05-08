//
//  VideoVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCell_Pad.h"
#import <MediaPlayer/MediaPlayer.h>
#import "VideoDataSource.h"
#import "BaseiPadController.h"

@class Video;
@interface VideoVC_Pad : BaseiPadController <UITableViewDataSource, UITableViewDelegate> {
	VideoCell_Pad *videoCell;
	MPMoviePlayerController *moviePlayer;
	UIButton *prevButton;
	NSMutableArray *items;
	UITableView *tableView;
	VideoDataSource *dataSource;
	
	NSMutableArray *methods;
	Video *currentVideo; 
}
@property (nonatomic, retain) Video *currentVideo; 
@property (nonatomic, retain) IBOutlet UIButton *prevButton;
@property (nonatomic, retain) IBOutlet VideoCell_Pad *videoCell;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) VideoDataSource *dataSource;
- (IBAction)buttonClick:(id)sender;

@end
