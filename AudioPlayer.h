//
//  AudioPlayer.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Audio.h"
#import <AVFoundation/AVFoundation.h>
#import "ASIHTTPRequest.h"
#import <MediaPlayer/MediaPlayer.h>
#import "AudioStreamer.h"

@interface AudioPlayer : NSObject <AVAudioPlayerDelegate> {
	id delegate;
	Audio *currentAudio;
	AudioStreamer *streamer;
	MPMoviePlayerController *player;
}
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) Audio *currentAudio;

+(AudioPlayer*)shared;
-(void)playAudio:(Audio*)audio delegate:(id)delegate;
-(void)stopAudio;
-(void)cancelRequest;
@end
