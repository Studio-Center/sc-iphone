//
//  SplashVC_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 26.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhoneNavigator;
@interface SplashVC_Phone : UIViewController {
	PhoneNavigator *navigator;
}

- (IBAction)buttonClick:(id)sender;

@end
