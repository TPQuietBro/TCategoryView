//
//  TCategoryContainerView.m
//  TCategoryView
//
//  Created by allentang on 2019/3/29.
//  Copyright © 2019 allentang. All rights reserved.
//

#import "TCategoryContainerView.h"
#import "TCategory.h"
@interface TCategoryContainerView()
@property (nonatomic, strong) NSArray *views;
@property (nonatomic, strong) NSMutableArray *viewsArray;
@end
@implementation TCategoryContainerView
- (instancetype)initWithContentViews:(NSArray *)views
{
    self = [super init];
    if (self) {
        _views = views;
        _viewsArray = [@[] mutableCopy];
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews{
    self.pagingEnabled = YES;
    
    for (NSInteger i = 0; i < self.views.count; ++i) {
        CGFloat red = arc4random_uniform(256)/ 255.0;
        CGFloat green = arc4random_uniform(256)/ 255.0;
        CGFloat blue = arc4random_uniform(256)/ 255.0;
        UIView *view = [[UIView alloc] init];
        [self addSubview:view];
        view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
        [_viewsArray addObject:view];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentSize = CGSizeMake(self.frame.size.width * self.views.count, 0);
    for (NSInteger i = 0; i < self.views.count; ++i) {
        UIView *view = self.viewsArray[i];
        view.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    }
}


@end
