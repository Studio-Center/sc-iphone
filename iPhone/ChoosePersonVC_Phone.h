//
//  ChoosePersonVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsynchronousImageButton.h"
#import "Talent.h"
#import "TalentDataSource.h"
#import "BaseViewController.h"
#import "PhoneNavigator.h"

@interface ChoosePersonVC_Phone : BaseViewController {
	UIScrollView *scrollView;
	id delegate;
	TalentDataSource *dataSource;
	NSArray *content;
	NSArray *pageContent;
	
	NSInteger currentPage;
	NSInteger maxPage;
	
	NSString *methodName;
	
	
	
}
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) TalentDataSource *dataSource;
@property (nonatomic, retain) NSArray *content;
@property (nonatomic, retain) NSArray *pageContent;
@property (nonatomic, retain) NSString *methodName;
@property NSInteger currentPage;
@property NSInteger maxPage;
- (void)photoClick:(id)sender;
@end
