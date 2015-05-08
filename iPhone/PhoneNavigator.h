//
//  PhoneNavigator.h
//  SCProduction
//
//  Created by Владимир Шевченко on 27.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhoneNavigator : UIViewController {
	UIView *mainView;
	UIButton *leftArrow;
	UIButton *rightArrow;
	UIButton *searchButton;
	UIButton *favoritesButton;
	
	UILabel *mainLabel;
	UIViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIView *mainView;
@property (nonatomic, retain) IBOutlet UIButton *leftArrow;
@property (nonatomic, retain) IBOutlet UIButton *rightArrow;
@property (nonatomic, retain) IBOutlet UIButton *searchButton;
@property (nonatomic, retain) IBOutlet UIButton *favoritesButton;
@property (nonatomic, retain) IBOutlet 	UILabel *mainLabel;

@property (nonatomic, retain ) UIViewController *viewController;

- (void)load:(NSString*)viewName;
- (void)makeArrowsHidden:(BOOL)flag;

- (void)leftArrowClick:(id)sender;
- (void)rightArrowClick:(id)sender;

- (IBAction)goHome:(id)sender;
- (IBAction)search:(id)search;
- (IBAction)gotoFavorites:(id)search;
+ (PhoneNavigator*)shared;

@end
