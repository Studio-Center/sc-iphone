//
//  AudioRecorder.h
//  VoiceConsultant
//
//  Created by fylfot on 4/2/10.
//  Copyright 2010 JAMG (for Dimalex). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioQueue.h>
#import <AudioToolbox/AudioFile.h>

#define NUM_BUFFERS 3
#define kAudioConverterPropertyMaximumOutputPacketSize 'xops'
#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

// Custom recording state storage
typedef struct { 
    AudioFileID audioFile;
    AudioStreamBasicDescription dataFormat;
    AudioQueueRef queue;
    AudioQueueBufferRef buffers[NUM_BUFFERS];
    UInt32 bufferByteSize;
    SInt64 currentPacket;
    BOOL recording;
} RecordState;

// Objective-C wrapper for the Audio Queue functionality

@interface AudioRecorder : NSObject {
    RecordState recordState;
    CFURLRef fileURL;
}

- (BOOL)isRecording;

// Automatically generate a dated file in Documents
- (void)toggleRecording;

// Manual recording
- (void)startRecording:(NSString *)filePath;
- (void)stopRecording;

+ (BOOL)inputSupported;

@end
