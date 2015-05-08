//
//  GetAudioRequest.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 6/29/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import "BaseRequest.h"

@interface GetAudioRequest : BaseRequest {
	NSInteger page;
	NSString *sortBy;
}
@property (assign) NSInteger page;
@property (nonatomic, retain) NSString *sortBy;

@end
