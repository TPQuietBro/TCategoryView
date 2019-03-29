//
//  TCategoryHeaderView.m
//  TCategoryView
//
//  Created by allentang on 2019/3/29.
//  Copyright © 2019 allentang. All rights reserved.
//

#import "TCategoryHeaderView.h"
#import "TCategory.h"

static NSInteger TempTag = 12121212121;
@interface TCategoryHeaderView()
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *buttons;
@end
@implementation TCategoryHeaderView
- (instancetype)initWithTitles:(NSArray *)titles
{
    self = [super init];
    if (self) {
        _titles = titles;
        _buttons = [@[] mutableCopy];
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{
    for (NSInteger i = 0; i < self.titles.count; ++i) {
        UIButton *button = [[UIButton alloc] init];
        [self addSubview:button];
        [button setTitle:[NSString stringWithFormat:@"button %zd",i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = TempTag + i;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttons addObject:button];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat margin = 10;
    CGFloat width = 75;
    CGFloat height = 30;
    for (NSInteger i = 0; i < self.buttons.count; ++i) {
        UIButton *button = self.buttons[i];
        button.frame = CGRectMake(i * (width + margin), (self.frame.size.height - height) * 0.5, width, height);
    }
    self.contentSize = CGSizeMake(self.buttons.count * width + (self.buttons.count - 1) * 10, 0);
}

- (void)clickButton:(UIButton *)sender{
    NSInteger index = sender.tag - TempTag;
    
}

@end
