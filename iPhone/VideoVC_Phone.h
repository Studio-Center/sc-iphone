//
//  VideoVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "VideoCell_iPhone.h"
#import "SOAPLoader.h"
#import "BaseViewController.h"

@interface VideoVC_Phone : BaseViewController <UITableViewDelegate, UITableViewDataSource> {
	
	NSMutableArray *items;
	VideoCell_iPhone *custormCell;
	MPMoviePlayerController *theMovie;
	UIButton *prevButton;
	UILabel *headerTitle;
	
	NSMutableArray *methods;
	
	SOAPLoader *loader;
	UITableView *tableView;
	UIButton *b1,*b2,*b3,*b4,*b5;
	
}
@property (nonatomic, retain) IBOutlet UIButton *b1,*b2,*b3,*b4,*b5;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UILabel *headerTitle;
@property (nonatomic, retain) IBOutlet UIButton *prevButton;
@property (nonatomic, retain) IBOutlet UITableViewCell *custormCell;
@property (nonatomic, retain) 	NSMutableArray *items;

- (IBAction)accessoryClick:(id)sender;
- (IBAction)buttonClick:(id)sender;
@end
