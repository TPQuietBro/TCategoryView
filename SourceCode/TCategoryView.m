//
//  TCategoryView.m
//  TCategoryView
//
//  Created by allentang on 2019/3/29.
//  Copyright © 2019 allentang. All rights reserved.
//

#import "TCategoryView.h"
#import "TCategory.h"
#import "TCategoryHeaderView.h"
#import "TCategoryContainerView.h"
@interface TCategoryView()
@property (nonatomic, strong) TCategoryHeaderView *headerView;
@property (nonatomic, strong) TCategoryContainerView *contentView;
@property (nonatomic, assign) NSInteger currentIndex;
@end
@implementation TCategoryView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubviews];
    }
    return self;
}
- (void)initSubviews{
    TCategoryHeaderView *headerView = [[TCategoryHeaderView alloc] initWithTitles:@[@"",@"",@"",@"",@"",@""]];
    _headerView = headerView;
    headerView.backgroundColor = [UIColor redColor];
    WEAK_SELF;
    headerView.switchButtonBlock = ^(NSInteger index) {
        STRONG_SELF;
        strongSelf.currentIndex = index;
        strongSelf.contentView.currentIndex = index;
        NSLog(@"%zd",index);
    };
    
    TCategoryContainerView *contentView = [[TCategoryContainerView alloc] initWithContentViews:@[@"",@"",@"",@"",@"",@""]];
    _contentView = contentView;
    contentView.backgroundColor = [UIColor orangeColor];
    contentView.delegate = self;
    [self addSubview:contentView];
    [self addSubview:self.headerView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).mas_equalTo(10);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

@end
