//
//  ViewController.m
//  响应链(hitText)
//
//  Created by 李震 on 2017/6/16.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)btnClicked:(id)sender
{
//    UIButton *tmpBtn = (UIButton *)sender;
//    NSLog(@"%ld", tmpBtn.tag);
    
    
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
