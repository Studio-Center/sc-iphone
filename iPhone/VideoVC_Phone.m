//
//  VideoVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VideoVC_Phone.h"
#import "Video.h"
#import "SOAPLoader.h"

@implementation VideoVC_Phone
@synthesize items;
@synthesize custormCell, prevButton, tableView, headerTitle;
@synthesize b1, b2, b3, b4, b5;

- (void)leftArrowClick{
	self.currentButtonTag--;
}

- (void)rightArrowClick {
	self.currentButtonTag++;
}

- (void)setCurrentButtonTag:(NSInteger)aTag {
	currentButtonTag = aTag;
	if (currentButtonTag == 6) {
		currentButtonTag = 0;
	} else {
		if (currentButtonTag == -1) {
			currentButtonTag = 6;
		}
	}
	
	switch (currentButtonTag) {
		case 0:
			[self buttonClick:b1];
			break;
		case 1:
			[self buttonClick:b2];
			break;
		case 2:
			[self buttonClick:b3];
			break;
		case 3:
			[self buttonClick:b4];
			break;
		case 4:
			[self buttonClick:b5];
			break;
		default:
			break;
	}
}

- (IBAction)buttonClick:(UIButton*)button {
	[prevButton setTitleColor:[UIColor colorWithRed:204.0/255.0 green:51.0/255.0 blue:0.0/255.0 alpha:1.0] forState:UIControlStateNormal];
	[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	headerTitle.text = [button titleLabel].text;
	prevButton = button;
	[self reload];
}

-(void)dataLoaded:(NSString*)xml {
	[items removeAllObjects];
	ElementParser* parser = [[ElementParser alloc] init];
	parser.delegate = self;
	[parser performSelector:@selector(getVideo:) forElementsMatching: @"record"];
	[parser parseXML:xml];
	[parser release];
	
	[tableView reloadData];
}

-(Video*)getVideo:(Element*)element {
	Video *model = [Video new];
	[model fillFromXML:element];
	
	element.domainObject = model;
	[items addObject:model];

	return [model autorelease];
}

#pragma mark -
#pragma mark tableView dataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [[NSBundle mainBundle] loadNibNamed:@"VideoCell" owner:self options:nil];
	
	VideoCell_iPhone *cell = [custormCell retain];
	
	self.custormCell = nil;
	
	cell.delegate = self;
	
	cell.stuff = [items objectAtIndex:indexPath.row];
	
	[cell setup];
	
	return [cell autorelease];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//if (indexPath.row % 2) {
	//	[cell setBackgroundColor:[UIColor grayColor]];
	//} else {
	//	[cell setBackgroundColor:[UIColor lightGrayColor]];
	//}
	[cell setBackgroundColor:[UIColor clearColor]];
}

#pragma mark -
#pragma mark tableView delegate methods

-(void)playVideo:(Video*)video {
	if (theMovie) {
		[theMovie stop];
	}
	if (![video url]) {
		return;
	}
	theMovie = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://www.yamaha.com/yamahavgn/Multimedia/MediaCenter/Downloads/drums_survivalguide_robison_2.m4v"]];
    [[NSNotificationCenter defaultCenter] addObserver:[[UIApplication sharedApplication] delegate]  
                                             selector:@selector(moviePlayBackDidFinish:)  
                                                 name:MPMoviePlayerPlaybackDidFinishNotification  
                                               object:theMovie];
	theMovie.scalingMode = MPMovieScalingModeAspectFill;
	
	[theMovie play];
    theMovie = nil;
}


#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad {
	
	headerTitle.font = [UIFont boldSystemFontOfSize:18];
	headerTitle.textColor = [UIColor lightGrayColor];
	tableView.separatorColor = [UIColor blackColor];
	
	methods = [NSMutableArray new];
	[methods addObject:@"getTVSpots"];
	[methods addObject:@"getLongForm"];
	[methods addObject:@"getMotionGraphics"];
	[methods addObject:@"getPreProduced"];
	[methods addObject:@"getOurReels"];
	
	items = [NSMutableArray new];
	
	loader = [SOAPLoader new];
	[loader setDelegate:self];
	[loader setOnSuccess:@selector(dataLoaded:)];
    
    b1.titleLabel.textAlignment = UITextAlignmentCenter;
    b1.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    
    b2.titleLabel.textAlignment = UITextAlignmentCenter;
    b2.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    
    b3.titleLabel.textAlignment = UITextAlignmentCenter;
    b3.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    
    b4.titleLabel.textAlignment = UITextAlignmentCenter;
    b4.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    
    b5.titleLabel.textAlignment = UITextAlignmentCenter;
    b5.titleLabel.font = [UIFont boldSystemFontOfSize:11];
	
	[self reload];
}

-(void)reload {
	[loader loadMethod:[methods objectAtIndex:[prevButton tag]]];
}

- (void)dealloc {
	[theMovie release];
	[loader release];
	[methods release];
	[items release];
    [super dealloc];
}


@end
