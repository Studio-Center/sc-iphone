//
//  BasicNavigator.h
//  SCProduction
//
//  Created by Владимир Шевченко on 21.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PadNavigator : UIViewController {
	NSMutableArray *commonSubviews;
	UIView *contentView;
	UIViewController *currentViewController;
	NSMutableDictionary *viewControllers;
	
	IBOutlet UIImageView *backgroundView;
	IBOutlet UIView *tabBar;
	BOOL canRotateLandscape;
	BOOL canRotatePortrait;
	IBOutlet UIButton *prevButton;

}

@property (nonatomic, retain) IBOutlet 	UIView *contentView;
@property (nonatomic, retain) UIViewController *currentViewController;
@property (nonatomic, retain) NSMutableDictionary *viewControllers;
@property 	BOOL canRotateLandscape;
@property 	BOOL canRotatePortrait;

+ (id)sharedNavigator;
+ (void)show;
- (void)updateViewController:(id)newViewController;
- (IBAction)buttonClick:(id)sender;
- (void)changeViewController:(NSString*)controllerName;
- (void)changeViewController:(NSString*)controllerName withParameters:(NSDictionary *)aParameters;
- (void)rotateToInterfaceOrientation:(UIInterfaceOrientation)anOrientation duration:(NSTimeInterval)duration;

@end
