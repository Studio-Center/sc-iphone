//
//  VoiceOverPoster.m
//  SCProduction
//
//  Created by Sergey Zenchenko on 8/16/10.
//  Copyright (c) 2010 JAMG. All rights reserved.
//

#import "VoiceOverPoster.h"


@implementation VoiceOverPoster
@synthesize firstName, lastName,stageName, email, birthDate, mailingAddress, file;
-(id)init {
    if(self = [super init]) {
        
    }
    return self;
}

-(void)send {
    request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://www.studiocenter.com/job-opportunities/apply-to-voice-over-talent-roster.aspx?pageid=190"]];
    request.delegate = self;
    request.didFinishSelector = @selector(finish);
    request.didFailSelector = @selector(fail);
    [request start];
}


-(void)finish {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information sended" message:@"" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert autorelease];
}

-(void)fail {
    
}
@end
