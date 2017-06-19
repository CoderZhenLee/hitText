//
//  SmallVIew.m
//  响应链(hitText)
//
//  Created by 李震 on 2017/6/16.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "SmallVIew.h"

@implementation SmallVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"SmallVIew" owner:self options:nil].firstObject;
        
        self.frame = frame;
        
    }
    return self;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    //1.判断下自己能否接收事件
//    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
//        return nil;
//    }
//    
//    //2.判断是否在当前区域内点击
//    if ([self pointInside:point withEvent:event] == NO) {
//        return nil;
//    }
//    
//    //3.从后向前遍历自己的子控件
//    NSInteger count = self.subviews.count;
//    for (NSInteger i = count-1; i >= 0; i++) {
//        
//        
//        //获取子控件
//        UIView *childView = self.subviews[i];
//        
//        //把当前坐标系上的点转换成子控件上的点
//        CGPoint childP = [self convertPoint:point toView:childView];
//        
//        UIView *fitView = [childView hitTest:childP withEvent:event];
//        
//        if (fitView) {
//            return fitView;
//        }
//    }
//    
//    //如果没有比自己合适的子控件，最适合的 View 就是自己
//    return self;
//}

@end
