//
//  ViewController.h
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 09.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"
#import "Task.h"
#import "OCAIAAudioController.h"


@interface OCAIAViewController : UIViewController

@property (strong, nonatomic) GameController *game;
@property (readonly, nonatomic) OCAIAAudioController *audioController;

@end

