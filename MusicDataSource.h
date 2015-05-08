//
//  MusicDataSource.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/20/10.
//  Copyright 2010 Dimalex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioDataSource.h"

@interface MusicDataSource : AudioDataSource {
	NSMutableDictionary *sections;
}

@end
