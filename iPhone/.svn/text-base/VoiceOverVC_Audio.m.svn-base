//
//  AudioVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 28.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VoiceOverVC_Audio.h"
#import "MixDataSource.h"
#import "AudioDataSource.h"
#import "Audio.h"
#import "PhoneNavigator.h"


@implementation VoiceOverVC_Audio
@synthesize audioTableView;
@synthesize audioCell, shakeCell, dataSource, headerTitle, prevButton;
@synthesize mixOfTheWeekButton, audioPostButton, onHoldMessagingButton;
@synthesize tableView;
@synthesize talent, shakeButton;


- (IBAction)buttonNavClick:(NSInteger)aTag {
	NSString *selView = [[NSString alloc] init];
	
	switch (aTag) {
		case 2:
			selView = @"VoiceOverVC_Phone";
			break;
	
	}
	
	if (navigator==nil) {
		navigator = [[PhoneNavigator alloc] init];
	}
	navigator.view.center = CGPointMake(navigator.view.center.x, 245);
	//UIWindow *window = [(AppDelegate_Phone*)[[UIApplication sharedApplication] delegate] window];
	//[UIView beginAnimations:@"ShowView" context:nil];
	//[UIView setAnimationDuration:1.0];
	//[UIView	setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
	[self.view addSubview:navigator.view];
	
	// Assuming *view is already set up as a UIView...
	for (int i = 0; i < [[self.view subviews] count]; i++ ) {
		[[[self.view subviews] objectAtIndex:i] removeFromSuperview];
	}
	
	[navigator load:selView];
	[selView autorelease];
	//[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"iPhonebkgd.png"]]];
	[UIView commitAnimations];
	
}


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
	if (currentButtonTag == 4) {
		currentButtonTag = 1;
	} else {
		if (currentButtonTag == -1) {
			currentButtonTag = 1;
		}
	}
	switch (currentButtonTag) {
		case 1:
			[self toogleTab:mixOfTheWeekButton];
			break;
		case 2:
			[self toogleTab:mixOfTheWeekButton];
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
	
	headerTitle.font = [UIFont boldSystemFontOfSize:18];
	headerTitle.textColor = [UIColor lightGrayColor];
	audioTableView.separatorColor = [UIColor blackColor];
	
	audioPostButton.titleLabel.textAlignment = UITextAlignmentCenter;
	mixOfTheWeekButton.titleLabel.textAlignment = UITextAlignmentCenter;
	onHoldMessagingButton.titleLabel.textAlignment = UITextAlignmentCenter;
    
	audioPostButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
	mixOfTheWeekButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
	onHoldMessagingButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
	
	dataSources = [NSMutableArray new];
	[dataSources addObject:[[MixDataSource new] autorelease]];
	[dataSources addObject:[[MixDataSource new] autorelease]];
	
	[[dataSources objectAtIndex:0] setMethodName:@"getMixOFWeek"];
	[[dataSources objectAtIndex:1] setMethodName:@"getOnHold"];
	
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
	[navigator release];
	[dataSource release];
    [dataSources release];
    [super dealloc];
}


@end
