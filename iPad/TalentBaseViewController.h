//
//  TalentBaseViewController.h
//  SCProduction
//
//  Created by Владимир Шевченко on 11.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseiPadController.h"

@interface TalentBaseViewController : BaseiPadController {
	NSDictionary *parameters;
}

@property (nonatomic, retain) NSDictionary *parameters;

@end
