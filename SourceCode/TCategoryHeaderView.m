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
@property (nonatomic, strong) UIButton *preButton;
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
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.tag = TempTag + i;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_buttons addObject:button];
        if (i == 0) {
            button.selected = YES;
            button.transform = CGAffineTransformScale(button.transform , 1.3, 1.3);;
            self.preButton = button;
        }
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
    sender.transform = CGAffineTransformIdentity;
    self.preButton.transform = CGAffineTransformIdentity;
    self.preButton.selected = NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.preButton.transform = CGAffineTransformScale(self.preButton.transform , 1, 1);
        sender.selected = YES;
        self.preButton = sender;
        sender.transform = CGAffineTransformScale(self.preButton.transform , 1.3, 1.3);
    }];
    

    NSInteger index = sender.tag - TempTag;
//    self.switchButtonBlock ? self.switchButtonBlock(index) : nil;
    SAFE_BLOCK(self.switchButtonBlock,index);
}

@end
