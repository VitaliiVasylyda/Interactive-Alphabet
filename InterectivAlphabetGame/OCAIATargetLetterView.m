//
//  OCAIATargetLetterView.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 14.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "OCAIATargetLetterView.h"


@implementation OCAIATargetLetterView

-(instancetype)initWithLetter:(NSString *)letter lenght:(float)wordLenght imageName:(NSString *)imgName{
    UIImage *backgroundImageLetter = [UIImage imageNamed:@"qvestionMark"];
    //when game is finish wrote, change this line of code.
    //UIImage *backgroundImageLetter = [UIImage imageNamed:imgName];
    self = [super initWithImage:backgroundImageLetter];
    if (self) {
        float scale = wordLenght/backgroundImageLetter.size.width;
        self.frame = CGRectMake(0, 0, backgroundImageLetter.size.width * scale, backgroundImageLetter.size.height * scale);
        self.isMaching = NO;
        _letter = letter;
    }
    return self;
}
@end
