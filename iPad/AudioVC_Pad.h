//
//  AudioViewController.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/2/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioVCFirst_Pad.h"
#import "AudioVCSecond_Pad.h"

@interface AudioVC_Pad : UIViewController {
	AudioVCFirst_Pad *first;
	AudioVCSecond_Pad *second;
}

@end
