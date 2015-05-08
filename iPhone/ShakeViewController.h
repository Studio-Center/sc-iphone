//
//  ShakeViewController.h
//  SCProduction
//
//  Created by Владимир Шевченко on 16.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Audio.h"
#import "Talent.h"

@interface ShakeViewController : UIViewController {
	UILabel *nameLabel;
	Audio *content;
	Talent *talent;
	id delegate;
	UIButton *button;
}
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) Audio *content;
@property (nonatomic, retain) Talent *talent;

- (void)shakeClick:(id)sender;
- (void)closeClick:(id)sender;
- (void)playClick:(id)sender;

@end
