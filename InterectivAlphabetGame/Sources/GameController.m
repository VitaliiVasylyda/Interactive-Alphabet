//
//  CameController.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "GameController.h"
#import "Task.h"
#import "OCAIALetterView.h"
#import "Config.h"
#import "OCAIATargetLetterView.h"
#import "OCAIAExplodeView.h"
#import "OCAIAViewController.h"
#import "AppDelegate.h"


static float xPoint;
static float yPoint;

@interface GameController() <LetterViewDelegate>
@property (strong, nonatomic) NSMutableArray *letters;
@property (strong, nonatomic) NSMutableArray *targets;
@end

@implementation GameController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.audioController = [OCAIAAudioController new];
        [self.audioController preloadSoundEffect:kAudioEffectFiles];
    }
    return self;
}

- (void)shakeLettersRandom{
    int randomIndex = arc4random()%[self.task.words count];
    NSArray *randomArray = self.task.words[randomIndex];
    NSString *randomString1 = randomArray[0];
    int lenght1 = (int)[randomString1 length];
    float letterSize = ceilf(kScreenWidth * 0.9 / (float) MAX(lenght1, lenght1)) - kLetterMargin;
    float xPositionFirstLetterLeftMargin = (kScreenWidth - MAX(lenght1, lenght1) * (letterSize + kLetterMargin)) / 2;
    xPositionFirstLetterLeftMargin += letterSize / 2;
    NSMutableArray *arrayIndex = [NSMutableArray new];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, lenght1)];
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        [arrayIndex addObject:[NSNumber numberWithInteger:idx]];
    }];
    self.letters = [NSMutableArray arrayWithCapacity:lenght1];
    for (int i = 0 ; i < lenght1 ; i ++) {
        NSInteger index = arc4random_uniform((u_int32_t) arrayIndex.count);
        NSInteger intValue = [[arrayIndex objectAtIndex:index]integerValue];
        NSString *letter = [randomString1 substringWithRange:NSMakeRange(intValue, 1)];
        if (![letter isEqualToString:@""]) {
            OCAIALetterView *letterView = [[OCAIALetterView alloc]initWithLetter:letter lenght:letterSize];
            letterView.center = CGPointMake(xPositionFirstLetterLeftMargin + i * (letterSize + kLetterMargin), (kScreenHeight / 4 * 3));
            [letterView randomYpositionForLater];
            letterView.delegat = self;
            [arrayIndex removeObjectAtIndex:index];
            [self.gameView addSubview:letterView];
            [self.letters addObject:letterView];
        }
    }
    self.targets = [NSMutableArray arrayWithCapacity:lenght1];
    for (int i = 0 ; i < lenght1 ; i++) {
        NSString *letter = [randomString1 substringWithRange:NSMakeRange(i, 1)];
        if (![letter isEqualToString:@""]) {
            OCAIATargetLetterView *targetView = [[OCAIATargetLetterView alloc]initWithLetter:letter lenght:letterSize];
            targetView.center = CGPointMake(xPositionFirstLetterLeftMargin + i * (letterSize + kLetterMargin), kScreenHeight/4);
            [self.gameView addSubview:targetView];
            [self.targets addObject:targetView];
        }
    }
}

- (void)placeLetter:(OCAIALetterView *)letter atTarget:(OCAIATargetLetterView *)targetLetter oldPoint:(float)xfPoint{
    letter.isMaching = YES;
    targetLetter.isMaching = YES;
    letter.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        letter.center = targetLetter.center;
        letter.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        targetLetter.hidden = YES;
    }];
    OCAIAExplodeView *explodeView = [[OCAIAExplodeView alloc]initWithFrame:CGRectMake(xPoint, yPoint, 10, 10)];
    [letter addSubview:explodeView];
    [letter sendSubviewToBack:explodeView];
}

-(void)checkForSuccess{
    for (OCAIATargetLetterView *target in self.targets ) {
        if (target.isMaching == NO)return;
    }
    OCAIATargetLetterView *target = self.targets[0];
    int startX = 0;
    int endX = kScreenWidth + 300;
    int startY = target.center.y;
    OCAIAExplodeView *explodeView = [[OCAIAExplodeView alloc]initWithFrame:CGRectMake(startX, startY, 10, 10)];
    [self.gameView addSubview:explodeView];
    [UIView animateWithDuration:3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.audioController playSound:kSoundWin];
                         explodeView.center = CGPointMake(endX, startY);
                     } completion:^(BOOL finished) {
                         [explodeView removeFromSuperview];
                         [self clearBoard];
                         [self shakeLettersRandom];
                     }];
}

- (void)clearBoard{
    [self.targets removeAllObjects];
    [self.targets removeAllObjects];
    for (UIView *view in self.gameView.subviews) {
        [view removeFromSuperview];
    }
}

#pragma mark - LetterViewDelegate
- (void)letterView:(OCAIALetterView *)letterView didDragToPoint:(CGPoint)letterViewPoint oldPoint:(float)oldPoint{
    OCAIATargetLetterView *targetView = nil;
    for (OCAIATargetLetterView *target in self.targets) {
        if (CGRectContainsPoint(target.frame, letterViewPoint)) {
            targetView = target;
            break;
        }
    }
    if (targetView != nil) {
        if ([targetView.letter isEqualToString:letterView.letter]){
            xPoint = targetView.frame.size.width / 2;
            yPoint = targetView.frame.size.height / 2;
            NSLog(@"Congradulated you correct replace letter");
            [self.audioController playSound:kSoundDing];
            [self placeLetter:letterView atTarget:targetView oldPoint:oldPoint];
            [self checkForSuccess];
        }
        else {
            for (OCAIALetterView *let in self.letters) {
                if ([let.letter isEqualToString:letterView.letter]) {
                    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                        [self.audioController playSound:kSoundWrong];
                        letterView.center = CGPointMake(oldPoint, (kScreenHeight / 4 * 1.6));
                    } completion:nil
                     ];
                }
            }
        }
    }
}

@end
