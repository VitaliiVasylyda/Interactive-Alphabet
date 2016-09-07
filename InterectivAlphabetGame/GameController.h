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


@interface GameController : NSObject

@property (strong, nonatomic) OCAIAAudioController *audioController;
@property (weak, nonatomic) UIView *gameView;
@property (strong, nonatomic) Task *task;
- (void)shakeLettersRandom;

@end
