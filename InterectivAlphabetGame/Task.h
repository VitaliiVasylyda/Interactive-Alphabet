//
//  GameController.h
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface Task : NSObject

@property (strong, nonatomic) NSMutableArray *words;
+(instancetype)loadWordsFromPlist;


@end
