//
//  MuHackAppDelegate.h
//  MuHack
//
//  Created by Andrew O'Neil-Smith on 2/22/14.
//  Copyright (c) 2014 MuHack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioEngine.h"


@interface MuHackAppDelegate : UIResponder <UIApplicationDelegate>
{
    // our one and only engine object
    AudioEngine *audioEngine;
    
    
}

@property (strong, nonatomic) UIWindow *window;

@end
