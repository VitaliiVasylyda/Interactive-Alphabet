//
//  OCAIATargetLetterView.h
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 14.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OCAIATargetLetterView : UIImageView

@property (strong,nonatomic) NSString *letter;
@property (assign, nonatomic) BOOL isMaching;
-(instancetype)initWithLetter:(NSString *)letter lenght:(float)wordLenght imageName:(NSString *)imgName;

@end
