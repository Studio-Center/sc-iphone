//
//  StartVC_Pad.h
//  SCProduction
//
//  Created by Владимир Шевченко on 16.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PadNavigator;
@interface StartVC_Pad : UIViewController {
	PadNavigator *basicNavigatorController;
}

- (IBAction)buttonClick:(id)sender;

@end
