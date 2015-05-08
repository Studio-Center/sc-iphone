//
//  OnCameraVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OnCameraVC_Phone.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PhoneNavigator.h"
#import <MessageUI/MessageUI.h>

@implementation OnCameraVC_Phone
@synthesize sendingDataForm;

-(IBAction)makeVideo:(id)sender {
	UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Select media source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:nil];
	NSArray *types = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary|UIImagePickerControllerSourceTypeCamera];
	[sheet addButtonWithTitle:@"Photo library"];
	if ([types count] == 2) {
		[sheet addButtonWithTitle:@"Camera"];
	}
	
	[sheet showInView:[[PhoneNavigator shared] view]];
	
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex==0) {
		return;
	}

	UIImagePickerController *picker = [UIImagePickerController new];
	if (buttonIndex == 1) {
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;	
	} else {
		if (buttonIndex == 2) {
			picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		}
	}

	picker.delegate = self;
	picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeImage];
	[[PhoneNavigator shared] presentModalViewController:picker animated:YES];
	
	[picker release];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[[PhoneNavigator shared] dismissModalViewControllerAnimated:YES];
	
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	NSData *data = UIImageJPEGRepresentation(image, 100.0);
	[self performSelector:@selector(sendMailWithData:) withObject:data afterDelay:2.0];	
}

-(void)sendMailWithData:(NSData*)data {
	MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
	mailPicker.mailComposeDelegate = self;
	
	[mailPicker setSubject:@"On Camera"];
	[mailPicker setToRecipients:[NSArray arrayWithObject:@"on-camera-talent-application-form@studiocenter.com"]];
	[mailPicker addAttachmentData:data mimeType:@"image/jpeg" fileName:@"camera.jpeg"];
	
	NSString *emailBody = @"";
	[mailPicker setMessageBody:emailBody isHTML:YES];
	
	[[PhoneNavigator shared] presentModalViewController:mailPicker animated:YES];
	[mailPicker release];
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	if (result == MFMailComposeResultSent) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"E-mail was sent" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert autorelease];
	}
	[[PhoneNavigator shared] dismissModalViewControllerAnimated:YES];
}

-(void)pick {
	
}

- (IBAction)sendVideo:(id)sender {
	
}

-(void)viewDidLoad {
	
	// add bckground image to stack
	UIImageView *bgImage;
	bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iPhonebkgd.png"]];	
	bgImage.frame = CGRectMake(0.0, -61.0, 320.0, 444.0);
	[self.view addSubview:bgImage];
	[self.view sendSubviewToBack:bgImage];
	
}

@end
