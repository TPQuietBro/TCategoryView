//
//  TCategoryContainerView.h
//  TCategoryView
//
//  Created by allentang on 2019/3/29.
//  Copyright © 2019 allentang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TCategoryContainerView : UIScrollView
- (instancetype)initWithContentViews:(NSArray *)views;
@property (nonatomic,assign) NSInteger currentIndex;
@end

NS_ASSUME_NONNULL_END
