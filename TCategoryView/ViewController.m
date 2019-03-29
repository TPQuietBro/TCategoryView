//
//  ViewController.m
//  TCategoryView
//
//  Created by allentang on 2019/3/29.
//  Copyright © 2019 allentang. All rights reserved.
//

#import "ViewController.h"
#import "TCategoryView.h"
#import "TCategory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TCategoryView *view = [TCategoryView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.left.bottom.right.mas_equalTo(0);
    }];
    
    
}


@end
