//
//  MusicVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MusicVC_Phone.h"
#import "Audio.h"
#import "AudioPlayer.h"
#import "MusicDataSourceiPhone.h"


@implementation MusicVC_Phone


- (void)viewDidLoad {
	tableView.separatorColor = [UIColor blackColor];
	
	dataSource = [MusicDataSourceiPhone new];
	dataSource.tableView = tableView;
	
	dataSource.delegate = self;
	
	[dataSource load];
}


-(void)viewWillDisappear:(BOOL)animated {
	[[AudioPlayer shared] stopAudio];	
}

-(void)viewWillAppear:(BOOL)animated {
	[[PhoneNavigator shared] makeArrowsHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated {
	
}

-(void)finishLoadFirst {
	[tableView reloadData];
}


@end
