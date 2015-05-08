//
//  PortraitDetailVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 06.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalentBaseViewController.h"
#import "Talent.h"

@interface PortraitDetailVC_Pad : TalentBaseViewController {

	UILabel *personNameLabel;
	UITextView *descriptionLabel;
	UIButton *favoriteButton;
	
	Talent *talent;
}
@property (nonatomic, retain) IBOutlet UIButton *favoriteButton;
@property (nonatomic, retain) IBOutlet UILabel *personNameLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionLabel;

@property (nonatomic, retain) Talent *talent;

- (IBAction)closeClick:(id)sender;
-(IBAction)favorite:(id)sender;
- (void)updateInfo;
@end
