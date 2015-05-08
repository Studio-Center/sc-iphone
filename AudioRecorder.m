//
//  AudioRecorder.m
//  VoiceConsultant
//
//  Created by fylfot on 4/2/10.
//  Copyright 2010 JAMG (for Dimalex). All rights reserved.
//

#import "AudioRecorder.h"
#import <AVFoundation/AVFoundation.h>


// Forward Declaration to Input Buffer Handler
static void HandleInputBuffer (void *aqData, AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, const AudioTimeStamp *inStartTime, UInt32 inNumPackets, const AudioStreamPacketDescription *inPacketDesc);

// C functions implementation.

// Derive the Buffer Size. I punt with the max buffer size.
void DeriveBufferSize (AudioQueueRef audioQueue, AudioStreamBasicDescription ASBDescription, Float64 seconds, UInt32 *outBufferSize) {
    static const int maxBufferSize = 0x50000;
    int maxPacketSize = ASBDescription.mBytesPerPacket;
    if (maxPacketSize == 0) {
        UInt32 maxVBRPacketSize = sizeof(maxPacketSize);
        AudioQueueGetProperty (audioQueue, kAudioConverterPropertyMaximumOutputPacketSize, &maxPacketSize, &maxVBRPacketSize);
    }
    Float64 numBytesForTime = ASBDescription.mSampleRate * maxPacketSize * seconds;
    *outBufferSize = (UInt32) ((numBytesForTime < maxBufferSize) ? numBytesForTime : maxBufferSize);
}

// Assign the file metadata
OSStatus SetMagicCookieForFile (AudioQueueRef inQueue, AudioFileID inFile) {
    OSStatus result = noErr;
    UInt32 cookieSize;
    if (AudioQueueGetPropertySize (inQueue, kAudioQueueProperty_MagicCookie, &cookieSize) == noErr) {
        char* magicCookie = (char *) malloc (cookieSize);
        if (AudioQueueGetProperty (inQueue, kAudioQueueProperty_MagicCookie, magicCookie, &cookieSize) == noErr) {
            result = AudioFileSetProperty (inFile, kAudioFilePropertyMagicCookieData, cookieSize, magicCookie);
        }
        free (magicCookie);
    }
    return result;
}

// Write out current packets
static void HandleInputBuffer (void *aqData, AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, const AudioTimeStamp *inStartTime, UInt32 inNumPackets, const AudioStreamPacketDescription *inPacketDesc) {
    //NSLog(@"test");
    RecordState *pAqData = (RecordState *) aqData;
    if (inNumPackets == 0 && pAqData->dataFormat.mBytesPerPacket != 0) {
        inNumPackets = inBuffer->mAudioDataByteSize / pAqData->dataFormat.mBytesPerPacket;
    }
    if (AudioFileWritePackets (pAqData->audioFile, NO, inBuffer->mAudioDataByteSize, inPacketDesc, pAqData->currentPacket, &inNumPackets, inBuffer->mAudioData) == noErr) {
        pAqData->currentPacket += inNumPackets;
        if (pAqData->recording == 0) {
            return;
        }
        AudioQueueEnqueueBuffer (pAqData->queue, inBuffer, 0, NULL);
        
    }
}


@interface NSDate (extended)
- (NSString*)formattedDateWithFormatString:(NSString*)dateFormatterString;
@end


@implementation NSDate (extended)
- (NSString*)formattedDateWithFormatString:(NSString*)dateFormatterString {
    if(!dateFormatterString) return nil;
    
    NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:dateFormatterString];
    [formatter setAMSymbol:@"am"];
    [formatter setPMSymbol:@"pm"];
    return [formatter stringFromDate:self];
}
@end

@implementation AudioRecorder
// Initialize the recorder
- (id) init { 
    self = [super init];
    recordState.recording = NO;
    return self;
}

// Set up the recording format as low-quality mono WAVE
- (void)setupAudioFormat:(AudioStreamBasicDescription*)format {
    
    int numTracks = 1;
    
    format->mSampleRate = 11025.0f;
    format->mFormatID = kAudioFormatLinearPCM;
    format->mFormatFlags = kLinearPCMFormatFlagIsSignedInteger | kLinearPCMFormatFlagIsPacked;
    format->mBytesPerFrame   = sizeof(SInt16) * numTracks;
    format->mFramesPerPacket = 1;
    format->mBytesPerPacket = format->mBytesPerFrame * format->mFramesPerPacket;
    format->mChannelsPerFrame = numTracks;
    format->mBitsPerChannel = 16;
    format->mReserved = 0;
}

// Begin recording
- (void)startRecording:(NSString *)filePath {
    bzero(&recordState.dataFormat, sizeof(recordState.dataFormat));
    [self setupAudioFormat:&recordState.dataFormat];

    fileURL = CFURLCreateFromFileSystemRepresentation (NULL, (const UInt8 *)[filePath UTF8String], [filePath length], NO);
    recordState.currentPacket = 0;
    OSStatus status;
    status = AudioQueueNewInput(&recordState.dataFormat, HandleInputBuffer, &recordState, CFRunLoopGetCurrent(), kCFRunLoopCommonModes, 0, &recordState.queue);
    if (status != 0) {
        printf("Could not establish new queue\n");
        return;
    }
    status = AudioFileCreateWithURL(fileURL, kAudioFileWAVEType, &recordState.dataFormat, kAudioFileFlags_EraseFile, &recordState.audioFile);
    if (status != 0) { 
        printf("Could not create file to record audio\n");
        return;
    }
    DeriveBufferSize(recordState.queue, recordState.dataFormat, 0.5, &recordState.bufferByteSize);

    for(int i = 0; i < NUM_BUFFERS; i++) { 
        status = AudioQueueAllocateBuffer(recordState.queue, recordState.bufferByteSize, &recordState.buffers[i]);
        if (status) {
            printf("Error allocating buffer %d\n", i);
            return;
        }
        status = AudioQueueEnqueueBuffer(recordState.queue, recordState.buffers[i], 0, NULL);
        if (status) {
            printf("Error enqueuing buffer %d\n", i);
            return;
        }
    }
    status = SetMagicCookieForFile(recordState.queue, recordState.audioFile);
    if (status != 0) { 
        printf("Magic cookie failed\n");
        return;
    }
    status = AudioQueueStart(recordState.queue, NULL);
    if (status != 0) { 
        printf("Could not start Audio Queue\n");
        return;
    }
    recordState.currentPacket = 0;
    recordState.recording = YES;
    return;
}

+ (BOOL)inputSupported {
    return [[AVAudioSession sharedInstance] inputIsAvailable];
}

// There’s generally about a one-second delay before the buffers fully empty
- (void)reallyStopRecording { 
    AudioQueueFlush(recordState.queue);
    AudioQueueStop(recordState.queue, NO);
    recordState.recording = NO;
    SetMagicCookieForFile(recordState.queue, recordState.audioFile);
    for(int i = 0; i < NUM_BUFFERS; i++) {
        AudioQueueFreeBuffer(recordState.queue,
                             recordState.buffers[i]);
    }
    AudioQueueDispose(recordState.queue, YES);
    AudioFileClose(recordState.audioFile);
}

// Stop the recording after waiting just a second
- (void)stopRecording { 
    [self performSelector:@selector(reallyStopRecording) withObject:NULL afterDelay:1.0f];
}

// Automatically create a file in Documents and start/stop recording to it
- (void)toggleRecording { 
    
    // Create a new dated file
    NSDate *now = [NSDate dateWithTimeIntervalSinceNow:0];
    NSString *caldate = [now DATE_AS_STRING];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.aiff", DOCUMENTS_FOLDER, caldate];
    if(!recordState.recording) { 
        printf("Starting recording\n");
        [self startRecording: filePath];
    } else { 
        printf("Stopping recording\n");
        [self stopRecording];
    }
}

- (BOOL)isRecording { 
    return recordState.recording;
}

@end

