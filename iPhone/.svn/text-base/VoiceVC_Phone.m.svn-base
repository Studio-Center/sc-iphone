//
//  VoiceVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VoiceVC_Phone.h"
#import "PhoneNavigator.h"
#import <MessageUI/MessageUI.h>
#import <AVFoundation/AVFoundation.h>

@implementation VoiceVC_Phone
@synthesize sendingDataForm;
@synthesize start, stop, play;
-(void)resetButtons {
	start.selected = stop.selected = play.selected = NO;
}

-(void)viewDidLoad {
	recorder = [AudioRecorder new];

	fileName = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/audio.wav"] retain];
	[[NSFileManager defaultManager] removeItemAtPath:fileName error:nil];
		
	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, -61.0, 320.0, 444.0);
	[self.view addSubview:bgImage];
	[self.view sendSubviewToBack:bgImage];

}

- (IBAction)record:(id)sender {
	[self resetButtons];
	if ([[AVAudioSession sharedInstance] inputIsAvailable]) {
		start.selected = YES;
		[recorder startRecording:fileName];
		timer = [NSTimer scheduledTimerWithTimeInterval:.6 target:self selector:@selector(tick) userInfo:nil repeats:YES];
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Sorry, there is no ability to record the voice on your device" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert autorelease];
	}
}
	

-(void)tick {
	if (start.tag == 0) {
		[start setImage:[UIImage imageNamed:@"record_selected_alt.png"] forState:UIControlStateSelected];
		start.tag = 1;
	} else {
		[start setImage:[UIImage imageNamed:@"record_selected.png"] forState:UIControlStateSelected];
		start.tag = 0;
	}
}

- (IBAction)stop:(id)sender {
	[timer invalidate];
	timer = nil;
	
	[self resetButtons];
	stop.selected = YES;
	if ([recorder isRecording]) {
		[recorder stopRecording];
	}
	[self performSelector:@selector(finishStop) withObject:nil afterDelay:0.5];
}

-(void)finishStop {
	stop.selected = NO;
}

- (IBAction)play:(id)sender {
	[self resetButtons];
	play.selected = YES;
	NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:fileName];
	[audioPlayer release];
	audioPlayer = [[AVAudioPlayer alloc] initWithData:[file readDataToEndOfFile] error:nil];
	audioPlayer.delegate = self;
	if (audioPlayer) {
		[audioPlayer play];
	}
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
	play.selected = NO;
}

- (IBAction)sendVoice:(id)sender {
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	[picker setToRecipients:[NSArray arrayWithObject:@"voice-over-talent-application-form@studiocenter.com"]];
	[picker setSubject:@"Voice"];
	
	[picker addAttachmentData:[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:fileName]] mimeType:@"audio/x-wav" fileName:@"voice.wav"];
	
	NSString *emailBody = @"";
	[picker setMessageBody:emailBody isHTML:YES];
	
	[[PhoneNavigator shared] presentModalViewController:picker animated:YES];
	[picker release];
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	if (result == MFMailComposeResultSent) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"E-mail was sent" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert autorelease];
	}
	[[PhoneNavigator shared] dismissModalViewControllerAnimated:YES];
}


@end
