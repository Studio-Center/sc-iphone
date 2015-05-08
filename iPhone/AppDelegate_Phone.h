//
//  AppDelegate_Phone.h
//  SCProduction
//
//  Created by Владимир Шевченко on 16.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SplashVC_Phone;
@interface AppDelegate_Phone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashVC_Phone *splashViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

