//
//  CameController.h
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import <UIKit/UIKit.h>
#import "OCAIALetterView.h"
#import "OCAIAAudioController.h"


typedef void(^startAgain)();

@interface GameController : NSObject

@property (strong, nonatomic) OCAIAAudioController *audioController;
@property (weak, nonatomic) UIView *gameView;
@property (strong, nonatomic) Task *task;
@property (strong, nonatomic) startAgain start;
@property (assign, nonatomic) BOOL repeatTheGame;
- (void)shakeLettersRandom;

@end
