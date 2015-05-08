//
//  ContactUsVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "EstimationViewController.h"

@interface ContactUsVC_Phone : BaseViewController {
	UIView *startView;
	UIView *mainView;
	UINavigationController *locationController;
	
	NSInteger currentTag;
	
	UIButton *auditionButton;
	UIButton *locationsButton;
	UIButton *estimationButton;
	UIButton *addressText;
	
	UITextView *phoneText;
	
	BaseViewController *currentViewController;
}

@property (nonatomic, retain) IBOutlet 	UIView *startView;
@property (nonatomic, retain) IBOutlet 	UIView *mainView;
@property NSInteger currentTag;

@property (nonatomic, retain) IBOutlet UITextView *phoneText;

@property (nonatomic, retain) IBOutlet UIButton *addressText;
@property (nonatomic, retain) IBOutlet UIButton *auditionButton;
@property (nonatomic, retain) IBOutlet UIButton *locationsButton;
@property (nonatomic, retain) IBOutlet UIButton *estimationButton;


- (IBAction)showLocations:(id)sender;
- (IBAction)showAuditions:(id)sender;
- (IBAction)showVoice:(id)sender;
- (IBAction)showOnCamera:(id)sender;
- (IBAction)showEstimation:(id)sender;
- (void)addViewAnimated:(UIView *)aView;

- (IBAction)addressClick;
- (void)clearButtons;
- (void)clearMainView;

- (IBAction)openTwitter;
- (IBAction)openYouTube;
- (IBAction)openFacebook;

@end
