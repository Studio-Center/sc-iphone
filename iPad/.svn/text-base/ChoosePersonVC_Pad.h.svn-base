//
//  ChoosePersonVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 23.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TalentBaseViewController.h"
#import "Talent.h"
@class TalentDataSource;


@interface ChoosePersonVC_Pad : TalentBaseViewController {
	UIScrollView *scrollView;
	NSArray *content;
	NSArray *pageContent;
	
	NSInteger currentPage;
	NSInteger maxPage;
	NSMutableArray *photos;
	NSMutableArray *indicators;
	
	UIButton *leftArrow;
	UIButton *rightArrow;
	
	TalentDataSource *dataSource;
	UIActivityIndicatorView *indicator;
	UIButton *talentButtonLeft;
	UIButton *talentButtonRight;
	
	NSMutableArray *methods;
	
	int currentSource;
}
@property (nonatomic, retain) IBOutlet UIButton *talentButtonLeft, *talentButtonRight;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSArray *content;
@property (nonatomic, retain) NSArray *pageContent;
@property NSInteger currentPage;

@property (nonatomic, retain) IBOutlet UIButton *leftArrow;
@property (nonatomic, retain) IBOutlet UIButton *rightArrow;

-(IBAction)clickLeftTalentButton;
-(IBAction)clickRightTalentButton;
- (void)photoClick:(id)sender;
- (IBAction)arrowClick:(id)sender;
- (void)generatePhotoViews;
- (void)deleteAllPhotos;
@end
