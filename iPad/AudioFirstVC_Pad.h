//
//  AudioVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 17.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioDataSource.h"
#import "AudioTalentVC_Pad.h"
#import "BaseiPadController.h"
#import "AudioRootVC_Pad.h"

@interface AudioFirstVC_Pad : BaseiPadController {
	UIButton *leftArrow;
	UIButton *rightArrow;
	
	UIView *leftView;
	UIView *rightView;
	UIView *middleView;
	
	AudioDataSource *firstDataSource;
	AudioDataSource *secondDataSource;
	
	UITableView *firstTable;
	UITableView *secondTable;
	
	UILabel *firstHeader, *secondHeader;
	
	UIButton *shakeButton1;
	UIButton *shakeButton2;
	UIButton *mainShakeButton;
	
	AudioTalentVC_Pad *talentVC;
	
	AudioRootVC_Pad *root;
}
@property (nonatomic, retain) AudioRootVC_Pad *root;
@property (nonatomic, retain) IBOutlet UIButton *shakeButton1;
@property (nonatomic, retain) IBOutlet UIButton *shakeButton2;
@property (nonatomic, retain) IBOutlet UIButton *mainShakeButton;
@property (nonatomic, retain) IBOutlet UILabel *firstHeader, *secondHeader;
@property (nonatomic, retain) IBOutlet UITableView *firstTable;
@property (nonatomic, retain) IBOutlet UITableView *secondTable;
@property (nonatomic, retain) IBOutlet UIButton *leftArrow;
@property (nonatomic, retain) IBOutlet UIButton *rightArrow;

@property (nonatomic, retain) IBOutlet UIView *leftView;
@property (nonatomic, retain) IBOutlet UIView *rightView;
@property (nonatomic, retain) IBOutlet UIView *middleView;

@property (nonatomic, retain) IBOutlet AudioDataSource *firstDataSource;
@property (nonatomic, retain) IBOutlet AudioDataSource *secondDataSource;

@property (nonatomic, retain) AudioTalentVC_Pad *talentVC;

- (IBAction)didClickRightArrow:(id)sender;
- (IBAction)didClickLeftArrow:(id)sender;
- (IBAction)shakeLeft;
- (IBAction)shakeRight;
@end
