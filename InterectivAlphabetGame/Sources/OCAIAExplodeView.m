//
//  OCAIAExplodeView.m
//  InterectivAlphabetGame
//
//  Created by Vitaliy Vasilida on 08.06.16.
//  Copyright © 2016 OCAIA. All rights reserved.
//

#import "OCAIAExplodeView.h"
#import "QuartzCore/QuartzCore.h"


@interface OCAIAExplodeView()

@property (strong, nonatomic)CAEmitterLayer *emitter;

@end

@implementation OCAIAExplodeView

+ (Class)layerClass{
    return [CAEmitterLayer class];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.emitter = (CAEmitterLayer *)self.layer;
        self.emitter.emitterPosition = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        self.emitter.emitterSize = self.bounds.size;
        self.emitter.emitterMode = kCAEmitterLayerAdditive;
        self.emitter.emitterShape = kCAEmitterLayerRectangle;
    }
    return self;
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    if (self.superview == nil)return;
    UIImage *texture = [UIImage imageNamed:@"blur"];
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.contents = (__bridge id)[texture CGImage];
    emitterCell.name = @"cell";
    emitterCell.alphaRange = 0.5;
    emitterCell.alphaSpeed = 0.005;
    emitterCell.birthRate = 100;
    emitterCell.lifetime = 0.5;
    emitterCell.blueRange = 0.33;
    emitterCell.blueSpeed = - 0.33;
    emitterCell.velocity = 160;
    emitterCell.velocityRange = 40;
    emitterCell.scaleRange = 0.5;
    emitterCell.scaleSpeed = - 1;
    emitterCell.emissionRange = M_PI * 2;
    self.emitter.emitterCells = @[emitterCell];
    [self performSelector:@selector(disableEmitterCell) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:2.0];
}

- (void)disableEmitterCell{
    [self.emitter setValue:@0 forKey:@"emitterCells.cell.birthRate"];
}
@end
