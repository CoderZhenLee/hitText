//
//  ScrollView.m
//  响应链(hitText)
//
//  Created by 李震 on 2017/6/19.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"ScrollView" owner:self options:nil].firstObject;
        
        self.frame = frame;
        
        [self createScrollView];
    }
    return self;
}

- (void)createScrollView
{
    self.contentSize = CGSizeMake(self.frame.size.width*5, self.frame.size.height);
    self.pagingEnabled = YES;
    self.bounces = NO;
    
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"图片%ld", i+1]];
        [self addSubview:imageView];
    }
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    //1.判断下自己能否接收事件
    if (self.alpha <= 0.01) {
        return nil;
    }

    //2.判断是否在当前区域内点击
    if ([self pointInside:point withEvent:event] == NO) {
        return nil;
    }
    else
    {
        //3.把当前坐标系上的点转换成父视图上的点
        CGPoint newPoint  = [self convertPoint:point toView:self.superview];
        
        //4.获取想要响应的 view
        UIView *view = self.superview.subviews[0];
        
        if (CGRectContainsPoint(view.frame, newPoint)) {
            return view;
        }
        else
        {
            //如果没有比自己合适的子控件，最适合的 View 就是自己
            return self;
        }
    }
}


@end
