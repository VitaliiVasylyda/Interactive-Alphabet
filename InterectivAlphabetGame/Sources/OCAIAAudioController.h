//
//  OCAIAAudioController.h
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 24.06.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OCAIAAudioController : NSObject

- (void)playSound:(NSString *)audio;
- (void)preloadSoundEffect:(NSArray *)soundEffects;
@end
