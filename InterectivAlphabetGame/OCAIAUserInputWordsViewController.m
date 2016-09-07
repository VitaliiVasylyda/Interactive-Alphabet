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


@interface OCAIAUserInputWordsViewController () <UITextFieldDelegate>

@property (strong, nonatomic) OCAIAViewController *nextVc;
@property (strong, nonatomic) AppDelegate *appDelegate;
@end

@implementation OCAIAUserInputWordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nextVc = [OCAIAViewController new];
    self.userEnterWord = [UITextField new];
    self.userEnterWord.backgroundColor = [UIColor whiteColor];
    self.userEnterWord.delegate = self;
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
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
}

- (void)startGameAction:(id)sender{
    [self presentViewController:self.nextVc animated:YES completion:nil];
}

#pragma  mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.appDelegate.userEnterWords addObject:textField.text];
    return  YES;
}
@end
