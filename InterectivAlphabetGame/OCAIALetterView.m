//
//  OCAIALetterView.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "OCAIALetterView.h"
#import "Config.h"
#import <QuartzCore/QuartzCore.h>


static float oldPoint;

@interface OCAIALetterView ()

@property (assign, nonatomic) int xPositionOffset;
@property (assign, nonatomic) int yPositionOffset;
@property (assign, nonatomic) CGAffineTransform tempTransform;
@end

@implementation OCAIALetterView

-(instancetype)initWithLetter:(NSString *)letter letterSize:(float)letterSize{
    UIImage *backgroundImageLetter = [UIImage imageNamed:@"characterFon"];
    self = [super initWithImage:backgroundImageLetter];
    if (self) {
        float scale = letterSize/backgroundImageLetter.size.width;
        self.frame = CGRectMake(0, 0, backgroundImageLetter.size.width * scale, backgroundImageLetter.size.height * scale);
        UILabel *character = [[UILabel alloc]initWithFrame:self.bounds];
        character.textAlignment = NSTextAlignmentCenter;
        UIColor *randomColor = [self randomColor];
        character.textColor = randomColor;
        character.backgroundColor = [UIColor clearColor];
        character.text = [letter uppercaseString];
        character.font = [UIFont fontWithName:@"Verdana-Bold" size:65.0];
        [self addSubview:character];
        self.isMaching = NO;
        _letter = letter;
        self.userInteractionEnabled = YES;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0;
        self.layer.shadowOffset = CGSizeMake(10.0f, 10.0f);
        self.layer.shadowRadius = 15.0f;
        self.layer.masksToBounds = NO;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
        self.layer.shadowPath = path.CGPath;
    }
    return self;
}
- (UIColor *)randomColor{
    CGFloat red = arc4random() % 255 / 255.0;
    CGFloat green = arc4random() % 255 / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:0 alpha:1.0];
    return color;
}

- (void)randomYpositionForLater{
    float rotation = randomf(0, 50) / (float) 100 - 0.2;
    self.transform = CGAffineTransformMakeRotation(rotation);
    int randomYpositionLetter = (arc4random() % 10) - 10;
    self.center = CGPointMake(self.center.x, self.center.y + randomYpositionLetter);
}

#pragma mark - draggin the letters

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint letterViewPoint = [[touches anyObject]locationInView:self.superview];
    oldPoint = self.center.x;
    self.xPositionOffset = letterViewPoint.x - self.center.x;
    self.yPositionOffset = letterViewPoint.y - self.center.y;
    self.layer.shadowOpacity = 0.8;
    self.tempTransform = self.transform;
    self.transform = CGAffineTransformScale(self.transform, 1.2, 1.2);
    [self.superview bringSubviewToFront:self];
    NSLog(@"Began");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint letterViewPoint = [[touches anyObject]locationInView:self.superview];
    self.center = CGPointMake(letterViewPoint.x - self.xPositionOffset, letterViewPoint.y - self.yPositionOffset);
    NSLog(@"movede");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesMoved:touches withEvent:event];
    self.transform = self.tempTransform;
    if (self.delegat) {
        [self.delegat letterView:self didDragToPoint:self.center oldPoint:oldPoint];
        NSLog(@"ended");
    }
    self.layer.shadowOpacity = 0.0;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.layer.shadowOpacity = 0.0;
    self.transform = self.tempTransform;
}
@end
