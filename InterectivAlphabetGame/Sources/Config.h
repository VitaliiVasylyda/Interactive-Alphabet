//
//  Config.h
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#ifndef Config_h
#define Config_h
//UI defines
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kLetterMargin 20
#define randomf(minX,maxX) ((float)(arc4random() % (maxX - minX + 1)) + (float)minX)
#define kSoundDing  @"ding.mp3"
#define kSoundWrong @"wrong.m4a"
#define kSoundWin   @"win.mp3"

#define kAudioEffectFiles @[kSoundDing, kSoundWrong, kSoundWin]
#endif
