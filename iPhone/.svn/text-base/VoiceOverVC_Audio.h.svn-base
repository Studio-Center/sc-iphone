//
//  VoiceOver_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 28.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioDataSource.h"
#import "BaseViewController.h"
#import "PhoneNavigator.h"
#import "Talent.h"
#import "ShakeViewController.h"


@class PhoneNavigator;
@interface VoiceOverVC_Audio : BaseViewController <UITableViewDelegate, UITableViewDataSource> {
	UITableView *audioTableView;
	UITableViewCell *shakeCell;
	UIButton *prevButton;
	AudioDataSource *dataSource;
	UILabel *headerTitle;
	UITableViewCell *audioCell;
	NSMutableArray *dataSources;
	
	UITableView *tableView;
	
	UIButton *mixOfTheWeekButton;
	UIButton *audioPostButton;
	UIButton *onHoldMessagingButton;
	
	Talent *talent;
	ShakeViewController *shakeViewController;
	UIButton *shakeButton;
	
	PhoneNavigator *navigator;
}
@property (nonatomic, retain) IBOutlet UIButton *shakeButton;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet AudioDataSource *dataSource;
@property (nonatomic, retain) IBOutlet UITableView *audioTableView;
@property (nonatomic, retain) IBOutlet UITableViewCell *audioCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *shakeCell;
@property (nonatomic, retain) IBOutlet UILabel *headerTitle;
@property (nonatomic, retain) IBOutlet UIButton *prevButton;

@property (nonatomic, retain) IBOutlet UIButton *mixOfTheWeekButton;
@property (nonatomic, retain) IBOutlet UIButton *audioPostButton;
@property (nonatomic, retain) IBOutlet UIButton *onHoldMessagingButton;


@property (nonatomic, retain) Talent *talent;

- (IBAction)toogleTab:(id)sender;
- (IBAction)buttonNavClick:(id)sender;
- (void)tabButtonClick:(id)sender;
- (IBAction)shake:(id)sender;
- (IBAction)shakeClick:(id)sender;
-(void)changeTalent:(id)talent;
@end
