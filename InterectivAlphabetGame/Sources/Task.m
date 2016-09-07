//
//  Task.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "Task.h"


@implementation Task

+ (instancetype)loadWordsFromPlist{
    NSString *pathToPlist = [[NSBundle mainBundle]pathForResource:@"Words" ofType:@"plist"];
    NSDictionary *dictOfwords = [NSDictionary dictionaryWithContentsOfFile:pathToPlist];
    Task *task = [Task new];
    task.words = dictOfwords[@"words"];
    return task;
}
@end

