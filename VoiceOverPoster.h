//
//  VoiceOverPoster.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright (c) 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@interface VoiceOverPoster : NSObject {
    ASIFormDataRequest *request;
    NSString *firstName, *lastName,*stageName, *email, *birthDate, *mailingAddress;
    NSData *file;
}
@property (nonatomic, retain) NSString *firstName, *lastName,*stageName, *email, *birthDate, *mailingAddress;
@property (nonatomic, retain) NSData *file;
@end
