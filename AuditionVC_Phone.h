//
//  AuditionVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoiceVC_Phone.h"
#import "OnCameraVC_Phone.h"
#import "BaseViewController.h"

#import "SendingDataForm.h"

@interface AuditionVC_Phone : BaseViewController {
	UIView *mainView;
	VoiceVC_Phone *voiceVc;
	OnCameraVC_Phone *oncameraVc;
	UIViewController *mainController;
	
	SendingDataForm *sendingDataForm;
}
@property (nonatomic, retain) UIViewController *mainController;
@property (nonatomic, retain) SendingDataForm *sendingDataForm;

-(IBAction)voice:(id)sender;
-(IBAction)camera:(id)sender;
@end
