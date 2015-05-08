//
//  MusicDataSourceiPhone.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/19/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "AudioDataSource.h"
#import "SOAPLoader.h"

@interface MusicDataSourceiPhone : AudioDataSource {
	NSMutableArray *jingels;
	NSMutableArray *original;
	SOAPLoader *jinglesLoader;
	SOAPLoader *originalLoader;
	
}

@end
