//
//  AudioEngine.mm
//  Created by willpirkle on 2/16/12.
//  Copyright 2011 University of Miami. All rights reserved.
//

#import "AudioEngine.h"


@implementation AudioEngine

// default initializer
- (id)init
{
	self = [super init];
    if (self) 
	{
        // Custom initialization - you probably want to setup variables here - WP
		
		
		// end init
    }
	
    return self;
}

// give me a file path, I load my player and queue it up!
- (BOOL)initAudioPlayerWithFile:(NSString *)audioFilePath
{
    if(audioFilePath)
	{
		// 1) URL
		NSURL *url = [NSURL fileURLWithPath:audioFilePath];
        
        // error check!!!! every step of the way
        if(!url)
            return NO; // fail
		
		// 2) init audio player with this mp3
		audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
		
		// 3) set the delegate
		[audioPlayer setDelegate:self];
        
        // 4) preload first buffer
        [audioPlayer prepareToPlay];
        
        // 5) enable metering
        [audioPlayer setMeteringEnabled:YES];
        
        // rockin
        return YES;
	}
    
    // fail
    return NO;
}

- (void)startAudioPlayer
{
    // start it
    [audioPlayer play];
}

- (void)stopAudioPlayer
{
    // stop it
    [audioPlayer stop];
}
- (bool)isPlaying
{
    return [audioPlayer isPlaying];
}

// returns meter value, -120dBFS -> 0dBFS
- (float)getLeftMeterValue
{
    // 1) as per documentation, call this first
    [audioPlayer updateMeters];
    
    // 2) now ask for the value and return it 
    return [audioPlayer averagePowerForChannel:0]; // channel 0 is LEFT
    
}
//Added by AOS
- (float)getRightMeterValue
{
    // 1) as per documentation, call this first
    [audioPlayer updateMeters];
    
    // 2) now ask for the value and return it
    return [audioPlayer averagePowerForChannel:1]; // channel 1 is RIGHT
    
}


- (void)dealloc 
{
    
    [super dealloc];
}
@end
