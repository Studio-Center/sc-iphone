//
//  TalentVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PadNavigator.h"
#import "BaseViewController.h"

@class ChoosePersonVC_Phone;
@interface TalentVC_Phone : BaseViewController {

	UIView *startView;
	UIView *mainView;
	UIButton *manButton;
	UIButton *womanButton;
	UIButton *kidsButton;
	UIButton *prevButton;
	UIButton *back;
	id viewController;
	
	NSArray *methods;
	UILabel *talentName;
}
@property (nonatomic, retain) id viewController;
@property (nonatomic, retain) IBOutlet UIView *startView;
@property (nonatomic, retain) IBOutlet UIView *mainView;
@property (nonatomic, retain) IBOutlet UIButton *manButton,*womanButton,*kidsButton;
@property (nonatomic, retain) IBOutlet UIButton *back;

- (IBAction)buttonClick:(id)sender;
- (IBAction)goBack:(id)sender;
@end
