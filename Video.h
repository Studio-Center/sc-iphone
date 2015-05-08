//
//  Video.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Audio.h"

@interface Video : Audio {
	NSString *length;
}
@property (nonatomic, retain) NSString *length;
@end
