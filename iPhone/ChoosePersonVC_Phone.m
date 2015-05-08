//
//  ChoosePersonVC_Phone.m
//  SCProduction
//
//  Created by Владимир Шевченко on 29.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#define photoWidth 72
#define photoHeight 88

#import "ChoosePersonVC_Phone.h"
#import "PersonDetailVC_Phone.h"
#import "PhoneNavigator.h"
#import "PhotoVC_Phone.h"

@implementation ChoosePersonVC_Phone
@synthesize scrollView, delegate;
@synthesize dataSource;
@synthesize content, pageContent;
@synthesize currentPage, maxPage, methodName;
static NSInteger savedCurrentPage = -1;
-(void)setContent:(NSArray *)aContent {
	
    [self removeSubview];
	[[[PhoneNavigator shared] rightArrow] setHidden:NO];
	[content release];
	content = [aContent retain];
	maxPage = [content count]/16-1;
	if (([content count] % 16) > 0) {
		maxPage++;
	}
	
}

- (void)removeSubview {
    UIView *c = [[[delegate view] subviews] lastObject];
    if (c.tag == 1401) {
        [UIView beginAnimations:@"asd" context:nil];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[delegate view] cache:YES];
        [c removeFromSuperview];
        [UIView setAnimationDuration:0.6f];
        [UIView commitAnimations];
    }
}

- (void)setCurrentPage:(NSInteger)number {
	
	currentPage = number;
	
	if (savedCurrentPage != -1) {
		currentPage = savedCurrentPage;

	}
	savedCurrentPage = -1;
	
	PhoneNavigator *navigator = [PhoneNavigator shared];
	if (currentPage == maxPage) {
		[navigator.rightArrow setHidden:YES];
	} 
	if (currentPage == 0) {
		[navigator.leftArrow setHidden:YES];
		[navigator.rightArrow setHidden:NO];
	} else {
		[navigator.leftArrow setHidden:NO];
	}

	if (maxPage == 1) {
		[navigator.rightArrow setHidden:YES];
		[navigator.leftArrow setHidden:YES];
	}
	if ((currentPage + 1)*16 < [content count]) {
		NSRange range; range.location = currentPage*16; range.length = 16;
		self.pageContent = [content subarrayWithRange:range];
	} else {
		NSRange range; range.location = currentPage*16; range.length = [content count] - currentPage*16;
		self.pageContent = [content subarrayWithRange:range];
	}
	[self performSelector:@selector(generatePhotoViews) withObject:nil afterDelay:0.1];
	NSLog(@"Current page:%d",currentPage);
}


- (IBAction)arrowClick:(id)sender {
	savedCurrentPage = -1;
	PhoneNavigator *navigator = [PhoneNavigator shared];
	[navigator.leftArrow setHidden:NO];
	[navigator.rightArrow setHidden:NO];
	if (sender == navigator.leftArrow) {
		self.currentPage--;
	}
	if (sender == navigator.rightArrow) {
		self.currentPage++;
	}
    
    [self removeSubview];
}

- (void)photoClick:(id)sender {
    PhotoVC_Phone *p = [[PhotoVC_Phone alloc] initWithNibName:@"PhotoVC_Phone" bundle:nil];
	[p setTalent:[pageContent objectAtIndex:[sender tag]]];

	savedCurrentPage = currentPage;
	
	[p setDelegate:delegate];
	[[PhoneNavigator shared] makeArrowsHidden:YES];
	p.talentPhoto = [sender backgroundImageForState:UIControlStateNormal];
	
	[UIView beginAnimations:@"asd" context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[delegate view] cache:YES];
	[[delegate view] addSubview:[p view]];
    [UIView setAnimationDuration:0.6f];
	[UIView commitAnimations];
	p.view.tag = 1401;
	[delegate setViewController:p];
	[p release];
}

- (void)generatePhotoViews {
	NSInteger personsCount = [pageContent count];
	for (UIView *subview in [scrollView subviews]) {
		[subview removeFromSuperview];
	}
	for (NSInteger i=0; i<personsCount; i++) {
		AsynchronousImageButton *button = [[AsynchronousImageButton alloc] initWithFrame:CGRectMake((i%4)*(photoWidth + 5) + 8, (i/4)*(photoHeight + 5) + 8, photoWidth, photoHeight)];
		[button loadImageFromURLString:[(Talent *)[pageContent objectAtIndex:i] url]];
		
		[button setBackgroundColor:[UIColor blackColor]];
		[button setTag:i];
		[scrollView addSubview:button];
		[button addTarget:self action:@selector(photoClick:) forControlEvents:UIControlEventTouchDown];
		[button release];
	}
	savedCurrentPage = -1;
}


- (void)viewDidLoad {
	NSLog(@"Load");
	dataSource = [TalentDataSource new];
	dataSource.methodName = methodName;
	dataSource.delegate = self;
	
	[dataSource load];
}

- (void)viewWillAppear:(BOOL)animated {

}

- (void)dealloc {
    [super dealloc];
}


@end
