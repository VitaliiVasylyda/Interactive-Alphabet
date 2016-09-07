//
//  OCAIALetterView.h
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 12.05.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import <UIKit/UIKit.h>


@class OCAIALetterView;

@protocol LetterViewDelegate <NSObject>

- (void)letterView:(OCAIALetterView *)letterView didDragToPoint:(CGPoint)letterViewPoint oldPoint:(float)oldPoint;

@end

@interface OCAIALetterView : UIImageView

@property (strong, nonatomic) NSString *letter;
@property (assign, nonatomic) BOOL isMaching;
@property (weak, nonatomic) id<LetterViewDelegate> delegat;
- (instancetype)initWithLetter:(NSString *)letter letterSize:(float)letterSize;
- (UIColor *)randomColor;
- (void)randomYpositionForLater;

@end
