//
//  SecondViewController.m
//  响应链(hitText)
//
//  Created by 李震 on 2017/6/16.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "SecondViewController.h"
#import "SmallVIew.h"
#import "ScrollView.h"

@interface SecondViewController ()

@property (nonatomic, strong) SmallVIew *smallView;

@property (nonatomic, strong) ScrollView *scrollView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITapGestureRecognizer *smallViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(smallViewTapClicked)];
    [self.smallView addGestureRecognizer:smallViewTap];
    
    
    UIPanGestureRecognizer *smallViewPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(smallViewPanClicked:)];
    [self.smallView addGestureRecognizer:smallViewPan];
    
    
    [self.view addSubview:self.smallView];
    
    [self.view addSubview:self.scrollView];
}

- (void)smallViewTapClicked
{
    NSLog(@"点击了view");
}

- (void)smallViewPanClicked:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan locationInView:self.view];
    
    
    CGPoint smallPoint = self.smallView.frame.origin;
    smallPoint.x = point.x;
    smallPoint.y = point.y;
    self.smallView.frame = CGRectMake(smallPoint.x, smallPoint.y, self.smallView.frame.size.width, self.smallView.frame.size.height);
    
    
    
    NSLog(@"%.2f--%.2f", point.x, point.y);
}


- (SmallVIew *)smallView
{
    if (!_smallView) {
        _smallView = [[SmallVIew alloc] initWithFrame:CGRectMake(100, 150, 150, 150)];
        
    }
    return _smallView;
}
- (ScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[ScrollView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 400)];
    }
    return _scrollView;
}
@end
