//
//  VoiceVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SendingDataForm.h"
#import "AudioRecorder.h"
#import <AVFoundation/AVFoundation.h>
@interface VoiceVC_Phone : BaseViewController <AVAudioPlayerDelegate> {
	SendingDataForm *sendingDataForm;
	AudioRecorder *recorder;
	BOOL recorded;
	NSString *fileName;
	
	UIButton *start,*stop,*play;
	
	NSTimer *timer;
	AVAudioPlayer *audioPlayer;
}
@property (nonatomic, retain) IBOutlet UIButton *start,*stop,*play;
@property (nonatomic, retain) SendingDataForm *sendingDataForm;

-(IBAction)record:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)play:(id)sender;

- (IBAction)sendVoice:(id)sender;
@end
