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
@interface OCAIAViewController ()

@end

@implementation OCAIAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Task *task = [Task loadWordsFromPlist];
    UIView *gameLayer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    gameLayer.backgroundColor = [UIColor grayColor];
    [self.view addSubview:gameLayer];
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
