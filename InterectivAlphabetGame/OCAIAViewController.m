//
//  ViewController.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 09.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "OCAIAViewController.h"
#import "Task.h"
#import "GameController.h"
#import "Config.h"
#import "OCAIAAudioController.h"
#import "AppDelegate.h"

@interface OCAIAViewController ()

@property (strong, nonatomic) OCAIAAudioController *audioController;

@end

@implementation OCAIAViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.audioController = [OCAIAAudioController new];
    [self.audioController preloadSoundEffect:kAudioEffectFiles];
    [self.audioController playSound:kSoundMainTheme];
    Task *task = [Task loadWordsFromPlist];
    UIView *gameLayer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    gameLayer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundFon"]];
    [self.view addSubview:gameLayer];
    self.game = [GameController new];
    self.game.gameView = gameLayer;
    self.game.task = task;
    [self.game shakeLettersRandom];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.game = [[GameController alloc]init];
    }
    return self;
}

@end
