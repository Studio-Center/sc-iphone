//
//  PhotoVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Talent.h"
#import "BaseViewController.h"
@class AsynchronousImageView;
@interface PhotoVC_Phone : BaseViewController {
	UILabel *labelName;
	id delegate;
	Talent *talent;
	UIImage *talentPhoto;
	AsynchronousImageView *photo;
	int page;
}
@property (assign) int page;
@property (nonatomic, retain) IBOutlet AsynchronousImageView *photo;
@property (nonatomic, retain) UIImage *talentPhoto;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) IBOutlet UILabel *labelName;
@property (nonatomic, retain) Talent *talent;

- (IBAction)showInfo:(id)sender;

@end
