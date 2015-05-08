//
//  BaseCell.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/14/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "BaseCell.h"
#import <MessageUI/MessageUI.h>
#import "PadNavigator.h"
#import "Talent.h"
#import "PhoneNavigator.h"

@implementation BaseCell
@synthesize allowFavorite, delegate, stuff, favButton;
-(void)dealloc {
	[delegate release];
	[stuff release];
	[favButton release];
	[super dealloc];
}

-(id)initWithStuff:(Stuff*)aStuff delegate:(id)aDelegate {
	if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sccell"]) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		self.stuff = aStuff;
		self.delegate = aDelegate;
		allowFavorite = YES;
		[self setupFavoriteButton];
		[self setup];
	}
	return self;
}

-(void)setup {
	
}

- (void)select {
	
}

- (void) changeFavButtonState {
	if ([stuff isFavorite]) {
		[favButton setImage:[UIImage imageNamed:@"star_selected.png"] forState:UIControlStateNormal];
	} else {
		[favButton setImage:[UIImage imageNamed:@"star_unselected.png"] forState:UIControlStateNormal];
	}
}

- (void) setupFavoriteButton {
	favButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
	[self changeFavButtonState];
	[favButton addTarget:self action:@selector(favorite) forControlEvents:UIControlEventTouchDown];
	[self addSubview:favButton];
}

-(void)favorite {
	if (![stuff isFavorite]) {
		[stuff setIsFavorite:YES];
	} else {
		[stuff setIsFavorite:NO];
	}
	[self changeFavButtonState];
}

-(void)setAllowFavorite:(BOOL)allow {
	allowFavorite = allow;
	if (allowFavorite) {
		[favButton setHidden:NO];
	} else {
		[favButton setHidden:YES];
	}
}

-(void)enableFavoritePageMode {
	if (isIPad)
	{
		UIButton *emailButton = [[UIButton alloc] initWithFrame:CGRectMake(663, 5, 20, 20)];
		[emailButton setImage:[UIImage imageNamed:@"letter.png"] forState:UIControlStateNormal];
		[emailButton addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchDown];
		[self.contentView addSubview:emailButton];
		[emailButton release];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(476, 5, 120, 20)];
		label.opaque = NO; 
		label.font = [UIFont systemFontOfSize:14];       
		label.textColor = [UIColor whiteColor];
		label.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateFormat:@"MM/dd/yyyy"];
		
		NSString *stringFromDate = [formatter stringFromDate:stuff.savedAt];

		[label setText:stringFromDate];

		
		[self addSubview:label];
		[label release];
		[formatter release];
	} else {
		UIButton *emailButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 5, 36, 25)];
		[emailButton setImage:[UIImage imageNamed:@"letter.png"] forState:UIControlStateNormal];
		[emailButton addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchDown];
		[self.contentView addSubview:emailButton];
		[emailButton release];
	}
}

-(void)sendEmail {
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	[picker setSubject:stuff.name];
	
	
	if ([stuff isMemberOfClass:[Talent class]]) {
		[picker setMessageBody:[stuff desc] isHTML:YES];
		
		UIImage *roboPic = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:stuff.url]]];
		NSData *imageData = UIImageJPEGRepresentation(roboPic, 1);
		[picker addAttachmentData:imageData mimeType:@"image/jpg" fileName:@"talent.jpg"];
		
	} else {
		[picker setMessageBody:[stuff url] isHTML:NO];
	}

	if (isIPad) {
		[[PadNavigator sharedNavigator] presentModalViewController:picker animated:YES];
	} else {
		[[PhoneNavigator shared] presentModalViewController:picker animated:YES];
	}

	[picker release];
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	
	if (result == MFMailComposeResultSent) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"E-mail was sent" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert autorelease];
	}
	
	if (isIPad) {
		[[PadNavigator sharedNavigator] dismissModalViewControllerAnimated:YES];
	} else {
		[[PhoneNavigator shared] dismissModalViewControllerAnimated:YES];
	}
	
}


- (NSInteger) indentationLevel {
	return 0;
}

@end
