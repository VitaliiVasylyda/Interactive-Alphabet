//
//  OCAIAStartGameViewController.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 31.08.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "OCAIAStartGameViewController.h"
#import "Config.h"
#import "OCAIAViewController.h"
#import "OCAIAUserInputWordsViewController.h"


@interface OCAIAStartGameViewController ()
@property (strong, nonatomic)  OCAIAViewController *vc;
@property (strong, nonatomic)  OCAIAUserInputWordsViewController *fillVc;
@end

@implementation OCAIAStartGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vc = [OCAIAViewController new];
    self.fillVc = [OCAIAUserInputWordsViewController new];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundFon"]];
    self.startGame = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.startGame addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchDown];
    self.fillTheNewWords = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.fillTheNewWords addTarget:self action:@selector(fillAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.startGame];
    [self.view addSubview:self.fillTheNewWords];
    [self.startGame setTitle:@"Start Game" forState:UIControlStateNormal];
    self.startGame.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:14.0];
    [self.startGame setBackgroundImage:[UIImage imageNamed:@"cloud1"] forState:UIControlStateNormal];
    [self.startGame setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.fillTheNewWords setBackgroundImage:[UIImage imageNamed:@"cloud1"] forState:UIControlStateNormal];
    [self.fillTheNewWords setTitle:@"Fill Words" forState:UIControlStateNormal];
    self.fillTheNewWords.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:14.0];
    [self.fillTheNewWords setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.fillTheNewWords.titleLabel.contentMode = UIViewContentModeCenter;
    self.startGame.frame = CGRectMake(self.view.center.x - (200 + kLetterMargin), self.view.center.y - 100, 200, 200);
    self.fillTheNewWords.frame = CGRectMake(self.view.center.x + kLetterMargin, self.view.center.y - 100, 200, 200);
}

- (void)startAction:(id)sender{
    [self presentViewController:self.vc animated:YES completion:nil];
}
- (void)fillAction:(id)sender{
    [self presentViewController:self.fillVc animated:YES completion:nil];
}

@end
