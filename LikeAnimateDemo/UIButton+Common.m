//
//  UIButton+Common.m
//  LikeAnimateDemo
//
//  Created by 罗成 on 16/3/11.
//  Copyright © 2016年 罗成. All rights reserved.
//

#import "UIButton+Common.h"
#import <pop/POP.h>
@implementation UIButton (Common)

- (void)animateToImage:(NSString *)imageName {
    
    UIImage *image = [UIImage imageNamed:imageName];
    if (!image ) {
        return;
    }
    
    [self setImage:image forState:UIControlStateNormal];
    
    if ([self superview]) {
        
        UIView *superV = [self superview];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        CGRect vFrame = [self convertRect:self.imageView.frame toView:superV];
        imageView.frame = vFrame;
        
        [superV addSubview:imageView];
        
        CGAffineTransform fromTransform = imageView.transform;
        CGPoint fromCenter = imageView.center;
        CGFloat dx = CGRectGetWidth(self.frame) / 2;
        CGFloat dy = CGRectGetHeight(self.frame) / 2;
        CGFloat dScale = 3.0f;
        CGFloat dRotation = M_PI_4;
        
        NSTimeInterval moveDurarion = 1.0f;
        
        POPCustomAnimation *moveA = [POPCustomAnimation animationWithBlock:^BOOL(id target, POPCustomAnimation *animation) {
            float time_percent = (animation.currentTime - animation.beginTime) / moveDurarion;
            UIView *view = (UIView *) target;
            //抛物线运动
            CGPoint toCenter = CGPointMake(fromCenter.x + time_percent * dx, fromCenter.y - (dy * time_percent * (5 - time_percent)));
            view.center = toCenter;
            CGAffineTransform toTransform = fromTransform;
            
            toTransform = CGAffineTransformTranslate(toTransform, 50, -50);
            
            CGFloat toScale = 1 + time_percent * (dScale - 1);//线性放大
            toTransform = CGAffineTransformMakeScale(toScale, toScale);
            
            CGFloat toRotation = dRotation * (1 - cosf(time_percent * M_PI_2));
            toTransform = CGAffineTransformRotate(toTransform, toRotation);
            view.transform = toTransform;
            view.alpha = 1- time_percent;
            
            
            return time_percent < 1.0;
        }];
        
        [imageView pop_addAnimation:moveA forKey:@"animateToImage"];
        
    }
        
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state {




}

@end
