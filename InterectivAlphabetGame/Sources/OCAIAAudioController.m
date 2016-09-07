//
//  OCAIAAudioController.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 24.06.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "OCAIAAudioController.h"
#import <AVFoundation/AVFoundation.h>


@interface OCAIAAudioController ()

@property (strong, nonatomic) NSMutableDictionary *audio;

@end

@implementation OCAIAAudioController

- (void)playSound:(NSString *)name{
    AVAudioPlayer *player = (AVAudioPlayer *)self.audio[name];
    if (player.isPlaying) {
        player.currentTime = 0;
    }
    else {
        [player play];
    }
}

- (void)preloadSoundEffect:(NSArray *)soundEffects{
    self.audio = [NSMutableDictionary dictionaryWithCapacity:soundEffects.count];
    for (NSString *sound in soundEffects) {
        NSString *soundPath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:sound];
        NSURL *soundUrl = [NSURL fileURLWithPath:soundPath];
        NSError *error = nil;
        AVAudioPlayer *player = [[AVAudioPlayer alloc]initWithContentsOfURL:soundUrl error:&error];
        player.numberOfLoops = 0;
        [player prepareToPlay];
        self.audio[sound] = player;
    }
}
@end
