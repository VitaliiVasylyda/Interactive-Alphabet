//
//  Task.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "Task.h"
#import "AppDelegate.h"

@implementation Task

+ (instancetype)loadWordsFromPlist{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSString *pathToPlist = [[NSBundle mainBundle]pathForResource:@"Words" ofType:@"plist"];
    NSMutableDictionary *dictOfwords = [NSMutableDictionary dictionaryWithContentsOfFile:pathToPlist];
    Task *task = [Task new];
    task.words = [NSMutableArray new];
    int counter = (int)appDelegate.userEnterWords.count;
    for (NSDictionary *dict in dictOfwords[@"words"]) {
        [task.words addObject:dict];
    }
    if (appDelegate.userEnterWords.count != 0) {
        for (int i = 0; i < counter; i++) {
            NSArray *array = [NSArray arrayWithObjects:appDelegate.userEnterWords[i], nil];
            [task.words addObject:array];
        }
    }
    

//    if (appDelegate.userEnterWords.count == 0) {
//        NSArray *arrayOfWords = [[NSArray alloc]initWithObjects:dictOfwords[@"words"], nil];
//        task.words = [arrayOfWords mutableCopy];
//    }
//    else {
//    NSArray *arrayOfWords = [[NSArray alloc]initWithObjects:appDelegate.userEnterWords[@"newWords"], dictOfwords[@"words"], nil];
//        task.words = [arrayOfWords mutableCopy];
//    }
    return task;
}

@end

