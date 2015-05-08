//
//  AudioVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 28.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AudioVC_Phone.h"
#import "MixDataSource.h"
#import "AudioDataSource.h"
#import "Audio.h"
#import "ForeignAudioDataSource.h"

@implementation AudioVC_Phone
@synthesize audioTableView;
@synthesize audioCell, shakeCell, dataSource, headerTitle, prevButton;
@synthesize kidsButton, top10MenButton, top10WomanButton, mixOfTheWeekButton, ForeignButton;
@synthesize tableView;
@synthesize talent, shakeButton;


- (void)setTalent:(Talent *)aTalent {
	talent = [aTalent retain];
	if (shakeViewController == nil) {
		shakeViewController = [[ShakeViewController alloc] initWithNibName:@"ShakeViewController" bundle:nil];
		[[self view] addSubview:shakeViewController.view];
		shakeViewController.view.center = CGPointMake(30, 10);
	}
	[shakeViewController setTalent:self.talent];
	[talent release];
}

- (void)setCurrentButtonTag:(NSInteger)aTag {
	[shakeViewController closeClick:nil];
	currentButtonTag = aTag;
	if (currentButtonTag == 5) {
		currentButtonTag = 0;
	} else {
		if (currentButtonTag == -1) {
			currentButtonTag = 4;
		}
	}
	switch (currentButtonTag) {
		case 0:
			[self toogleTab:kidsButton];
			break;
		case 1:
			[self toogleTab:top10MenButton];
			break;
		case 2:
			[self toogleTab:top10WomanButton];
			break;
		case 3:
			[self toogleTab:mixOfTheWeekButton];
			break;
		case 4:
			[self toogleTab:ForeignButton];
			break;
		default:
			break;
	}
}

- (IBAction)shake:(id)sender {
	[dataSource shake:sender];
}

-(void)viewWillDisappear:(BOOL)animated {
	[[AudioPlayer shared] stopAudio];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	kidsButton.titleLabel.textAlignment = UITextAlignmentCenter;
    top10MenButton.titleLabel.textAlignment = UITextAlignmentCenter;
    top10WomanButton.titleLabel.textAlignment = UITextAlignmentCenter;
    mixOfTheWeekButton.titleLabel.textAlignment = UITextAlignmentCenter;
    ForeignButton.titleLabel.textAlignment = UITextAlignmentCenter;
    
    kidsButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    top10MenButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    top10WomanButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    mixOfTheWeekButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    ForeignButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
	
	dataSources = [NSMutableArray new];
	[dataSources addObject:[[AudioDataSource new] autorelease]];
	[dataSources addObject:[[AudioDataSource new] autorelease]];
	[dataSources addObject:[[AudioDataSource new] autorelease]];
	[dataSources addObject:[[MixDataSource new] autorelease]];
	[dataSources addObject:[[ForeignAudioDataSource new] autorelease]];
	
	[[dataSources objectAtIndex:0] setMethodName:@"getKidsAudio"];
	[[dataSources objectAtIndex:1] setMethodName:@"top10Man"];
	[[dataSources objectAtIndex:2] setMethodName:@"top10Woman"];
	[[dataSources objectAtIndex:3] setMethodName:@"getMixOFWeek"];
	[[dataSources objectAtIndex:4] setMethodName:@"getForeignAudio"];
	
	dataSource = [dataSources objectAtIndex:0];
	dataSource.tableView = tableView;
	dataSource.delegate = self;
	[dataSource load];

	
	[[NSNotificationCenter defaultCenter] addObserver: self
											 selector: @selector(handleShakeEvent)
												 name: K_SHAKE_EVENT
											   object: nil];
}

-(void) handleShakeEvent
{
	[dataSource shake:nil];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[[PhoneNavigator shared] makeArrowsHidden:NO];
}

- (void)reload {
	[audioTableView reloadData];
}

-(void)changeTalent:(Audio*)audio {
	if(shakeViewController == nil)
    {
        shakeViewController = [[ShakeViewController alloc] initWithNibName:@"ShakeViewController" bundle:nil];
        [self.view addSubview:shakeViewController.view];
        shakeViewController.view.center = CGPointMake(160, -100);
    }
	shakeViewController.delegate = dataSource;
    [shakeViewController setContent:audio];
    shakeViewController.talent = audio.author;
    [UIView beginAnimations:@"show" context:nil];
    shakeViewController.view.center = CGPointMake(160, 50);
    [UIView commitAnimations];
   
}


- (IBAction)toogleTab:(UIButton*)sender {
	shakeButton.hidden = ([sender tag] == 3);
	
	[shakeViewController closeClick:nil];
	[prevButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	UIButton *button = (UIButton*)sender;
	[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	prevButton = button;
	for (UIView *view in tableView.subviews) {
		if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
			[view removeFromSuperview];
		}
	}
	dataSource.tableView = nil;
	dataSource = [dataSources objectAtIndex:sender.tag];
	dataSource.tableView = tableView;
    dataSource.delegate = self;
	[dataSource load];
	
	headerTitle.text = [sender titleLabel].text;
}

- (void)dealloc {
	[dataSource release];
    [dataSources release];
    [super dealloc];
}


@end
