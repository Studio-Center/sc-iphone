//
//  ChoosePersonVC_Pad.m
//  SCProduction
//
//  Created by Владимир Шевченко on 23.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

//#define photoWidth 128
//#define photoHeight 132

#import "ChoosePersonVC_Pad.h"
#import "PadNavigator.h"
#import "AsynchronousImageButton.h"
#import "TalentDataSource.h"
#import <QuartzCore/QuartzCore.h>

@implementation ChoosePersonVC_Pad
@synthesize scrollView;
@synthesize content, pageContent;
@synthesize currentPage;
@synthesize leftArrow, rightArrow, indicator;
@synthesize talentButtonLeft, talentButtonRight;

#pragma mark -
#pragma mark setters
- (void)setParameters:(NSDictionary *)aParameters {
	[leftArrow setHidden:NO];
	[rightArrow setHidden:NO];
	[self deleteAllPhotos];
	[indicator setHidesWhenStopped:YES];
	[indicator startAnimating];
	
	[dataSource release];
	
	dataSource = [TalentDataSource new];
	dataSource.methodName = [aParameters valueForKey:@"methodName"];
	dataSource.delegate = self;
	
	[methods release];
	methods = [[NSArray alloc] initWithObjects:@"getWomans",@"getMans",@"getKids",nil];
	currentSource =  [methods indexOfObject:dataSource.methodName];
	
	NSMutableArray *savedContent = [aParameters valueForKey:@"savedContent"];
	if (savedContent) {
		[self setContent:savedContent];
	} else {
		[dataSource load];
	}
	
	NSNumber *currentPageSaved = [aParameters valueForKey:@"currentPage"];
	if (currentPageSaved) {
		self.currentPage = [currentPageSaved intValue];
	}
}

-(IBAction)clickLeftTalentButton {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	if ([dataSource.methodName isEqualToString:@"getMans"]) {
		[dict setValue:@"getWomans" forKey:@"methodName"];
	} else {
		if ([dataSource.methodName isEqualToString:@"getWomans"]) {
			[dict setValue:@"getMans" forKey:@"methodName"];
		} else {
			[dict setValue:@"getWomans" forKey:@"methodName"];
		}
	}
	
	[[PadNavigator sharedNavigator] changeViewController:@"ChoosePerson" withParameters:dict];
}

-(IBAction)clickRightTalentButton {
	NSMutableDictionary *dict = [NSMutableDictionary dictionary];
	if ([dataSource.methodName isEqualToString:@"getMans"]) {
		[dict setValue:@"getKids" forKey:@"methodName"];
	} else {
		if ([dataSource.methodName isEqualToString:@"getWomans"]) {
			[dict setValue:@"getKids" forKey:@"methodName"];
		} else {
			[dict setValue:@"getMans" forKey:@"methodName"];
		}
	}
	
	[[PadNavigator sharedNavigator] changeViewController:@"ChoosePerson" withParameters:dict];
}

-(void)setupButtons {
	if ([dataSource.methodName isEqualToString:@"getMans"]) {
		[talentButtonLeft setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
		[talentButtonRight setImage:[UIImage imageNamed:@"3-r.png"] forState:UIControlStateNormal];
	} else {
		if ([dataSource.methodName isEqualToString:@"getWomans"]) {
			[talentButtonLeft setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
			[talentButtonRight setImage:[UIImage imageNamed:@"3-r.png"] forState:UIControlStateNormal];
		} else {
			[talentButtonLeft setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
			[talentButtonRight setImage:[UIImage imageNamed:@"1-r.png"] forState:UIControlStateNormal];
		}
	}
}


-(void)setContent:(NSArray *)aContent {
	[indicator stopAnimating];
	
	[content release];
	content = [aContent retain];
	maxPage = [content count]/21-1;
	if (([content count] % 21) > 0) {
		maxPage++;
	}
}

- (void)setCurrentPage:(NSInteger)number {
	currentPage = number;
	if (currentPage == maxPage) {
		[self.rightArrow setHidden:YES];
	} 
	if (currentPage == 0) {
		[self.leftArrow setHidden:YES];
	}
	
	if ((currentPage + 1)*21 < [content count]) {
		NSRange range; range.location = currentPage*21; range.length = 21;
		self.pageContent = [content subarrayWithRange:range];
	} else {
		NSRange range; range.location = currentPage*21; range.length = [content count] - currentPage*21;
		self.pageContent = [content subarrayWithRange:range];
	}
	[self performSelector:@selector(generatePhotoViews) withObject:nil afterDelay:0.1];
}


- (IBAction)arrowClick:(id)sender {
	[leftArrow setHidden:NO];
	[rightArrow setHidden:NO];
	if (sender == leftArrow) {
		self.currentPage--;
	}
	if (sender == rightArrow) {
		self.currentPage++;
	}
}

- (void)generatePhotoViews {
	NSInteger personsCount = [pageContent count];
	
	CGFloat photoWidth = ((scrollView.frame.size.width - 36) / 7);
	CGFloat photoHeight = photoWidth*1.3;
	
	if (photos == nil) {
		photos = [NSMutableArray new];
		indicators = [NSMutableArray new];
	} else {
		[self deleteAllPhotos];
	}
	
	for (NSInteger i=0; i<personsCount; i++) {
		AsynchronousImageButton *button = [[AsynchronousImageButton alloc] initWithFrame:CGRectMake((i%7)*(photoWidth + 4) + 8, (i/7)*(photoHeight + 4) + 8, photoWidth, photoHeight)];
		[button loadImageFromURLString:[(Talent *)[pageContent objectAtIndex:i] url]];
		
		[button setBackgroundColor:[UIColor blackColor]];
		[button setTag:i];
		[scrollView addSubview:button];
		[button addTarget:self action:@selector(photoClick:) forControlEvents:UIControlEventTouchDown];
		[photos addObject:button];
		[button release];
	}	
}

- (void)deleteAllPhotos {
	for (UIButton *button in photos) {
		[button removeFromSuperview];
	}
	[photos removeAllObjects];
}


- (void)photoClick:(id)sender {
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[pageContent objectAtIndex:[sender tag]] forKey:@"person"];
	[dict setValue:dataSource.methodName forKey:@"methodName"];
	[dict setValue:[NSNumber numberWithInt:currentPage] forKey:@"currentPage"];
	[dict setValue:content forKey:@"savedContent"];
	
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[dict setObject:animation forKey:@"animation"];
	
	[[PadNavigator sharedNavigator] changeViewController:@"PersonDetail" withParameters:dict];
}

-(void)viewWillAppear:(BOOL)animated {
	[self setupButtons];	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


- (void)didReceiveMemoryWarning {
	[self deleteAllPhotos];
    [super didReceiveMemoryWarning];
}

@end
