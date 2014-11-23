//
//  UITwirlView.m
//  Twirly
//
//  Created by Randy on 11/12/14.
//

#import "UITwirlView.h"

@implementation UITwirlView


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        float startvalue = arc4random() % 360;
        CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.fromValue = [NSNumber numberWithFloat:0.0f + startvalue];
        animation.toValue = [NSNumber numberWithFloat: (2*M_PI) + startvalue];
        animation.duration =  arc4random() % 10 + 15;
        animation.repeatCount = HUGE_VAL;
        [self.layer addAnimation:animation forKey:@"MyAnimation"];
        
        [self enableMotionEffects:arc4random()%15+5 rotate:arc4random()%1+.5];

    }
    return self;
}

-(void)enableMotionEffects:(float)amount rotate:(float)r
{
    // Set rotation effect
    UIInterpolatingMotionEffect *rotateMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"transform.rotation.z" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    rotateMotionEffect.minimumRelativeValue = @(-r);
    rotateMotionEffect.maximumRelativeValue = @(r);
    
    // Set vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-amount);
    verticalMotionEffect.maximumRelativeValue = @(amount);
    
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-amount);
    horizontalMotionEffect.maximumRelativeValue = @(amount);
    
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[rotateMotionEffect, horizontalMotionEffect, verticalMotionEffect];
    
    [self addMotionEffect:group];
}

@end
