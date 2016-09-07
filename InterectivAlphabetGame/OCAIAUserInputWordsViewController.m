//
//  OCAIAUserInputWordsViewController.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 31.08.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "OCAIAUserInputWordsViewController.h"
#import "Config.h"
#import "OCAIAViewController.h"
#import "AppDelegate.h"


@interface OCAIAUserInputWordsViewController ()

@property (strong, nonatomic) OCAIAViewController *nextVc;
@property (strong, nonatomic) AppDelegate *appDelegate;
@end

@implementation OCAIAUserInputWordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nextVc = [OCAIAViewController new];
    self.userEnterWord = [UITextField new];
    self.userEnterWord.backgroundColor = [UIColor whiteColor];
    self.userEnterWord.textAlignment = NSTextAlignmentCenter;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundFon"]];
    [self.view addSubview:self.userEnterWord];
    self.userEnterWord.frame = CGRectMake(self.view.center.x - 100, self.view.center.y - 75, 200, 50);
    self.letsGame = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.letsGame addTarget:self action:@selector(startGameAction:) forControlEvents:UIControlEventTouchDown];
    self.letsGame.frame = CGRectMake(self.view.center.x - 100, self.view.center.y, 200, 200);
    [self.letsGame setBackgroundImage:[UIImage imageNamed:@"cloud1"] forState:UIControlStateNormal];
    [self.letsGame setTitle:@"Lets game" forState:UIControlStateNormal];
    self.letsGame.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:14];
    [self.letsGame setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.letsGame];
    self.ok = [UIButton buttonWithType:UIButtonTypeSystem];
    self.ok.frame = CGRectMake(self.view.center.x + 120, self.view.center.y - 90, 100, 100);
    [self.ok setBackgroundImage:[UIImage imageNamed:@"cloud1"] forState:UIControlStateNormal];
    [self.ok setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.ok setTitle:@"Ok" forState:UIControlStateNormal];
    self.ok.titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:14.0];
    [self.ok addTarget:self action:@selector(addNewWord:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.ok];
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
}

- (void)startGameAction:(id)sender{
    [self presentViewController:self.nextVc animated:YES completion:nil];
}

- (void)addNewWord:(id)sender{
    [self.appDelegate.userEnterWords addObject:self.userEnterWord.text];
    self.userEnterWord.text = @"";
}

@end
