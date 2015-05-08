//
//  PersonDetailVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 23.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalentBaseViewController.h"
#import "Talent.h"
@class AsynchronousImageView;

@interface PersonDetailVC_Pad : TalentBaseViewController {
	UIView *landscapeView;
	UIView *portraitView;
	UIView *portraitDetailView;
	UIView *mainView;
	
	UILabel *personNameLabel;
	UITextView *descriptionLabel;
	
	UILabel *skillsLabel;
	UILabel *heightLabel;
	UILabel *shirtLabel;
	UILabel *waistLabel;
	UILabel *bustLabel;
	UILabel *dressLabel;
	UILabel *shoeLabel;
	
	AsynchronousImageView *bigPhotoView;
	AsynchronousImageView *smallPhotoView;
	
	UIButton *favoriteButton;
	
	Talent *talent;
	NSString *methodName;
	UIButton *talentButtonLeft;
	UIButton *talentButtonRight;
	IBOutlet UILabel *portailDesc;
	
	NSNumber *currentPage;
	NSMutableArray *savedContent;
}

@property (nonatomic, retain) IBOutlet UIButton *talentButtonLeft, *talentButtonRight;
@property (nonatomic, retain) IBOutlet UIView *landscapeView;
@property (nonatomic, retain) IBOutlet UIView *portraitView;
@property (nonatomic, retain) IBOutlet UIView *portraitDetailView;
@property (nonatomic, retain) IBOutlet UIView *mainView;
@property (nonatomic, retain) IBOutlet UIButton *favoriteButton;
@property (nonatomic, retain) IBOutlet UILabel *personNameLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *skillsLabel;
@property (nonatomic, retain) IBOutlet UILabel *heightLabel;
@property (nonatomic, retain) IBOutlet UILabel *shirtLabel;
@property (nonatomic, retain) IBOutlet UILabel *waistLabel;
@property (nonatomic, retain) IBOutlet UILabel *bustLabel;
@property (nonatomic, retain) IBOutlet UILabel *dressLabel;
@property (nonatomic, retain) IBOutlet UILabel *shoeLabel;

@property (nonatomic, retain) IBOutlet AsynchronousImageView *bigPhotoView;
@property (nonatomic, retain) IBOutlet AsynchronousImageView *smallPhotoView;

@property (nonatomic, retain) 	Talent *talent;
-(IBAction)clickLeftTalentButton;
-(IBAction)clickRightTalentButton;
- (IBAction)closeClick:(id)sender;
- (IBAction)infoClick:(id)sender;
- (IBAction)favorite:(id)sender;
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
- (void)updatePerson;
- (void)remooveAllSubviews;
@end
