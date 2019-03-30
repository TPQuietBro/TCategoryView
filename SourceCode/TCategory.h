//
//  TCategory.h
//  TCategoryView
//
//  Created by allentang on 2019/3/29.
//  Copyright © 2019 allentang. All rights reserved.
//

#ifndef TCategory_h
#define TCategory_h

#import "TCategoryView.h"
#import "Masonry.h"

#define WEAK_SELF __weak typeof(self) weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf) strongSelf = weakSelf

#define SAFE_BLOCK(block,...) block ? block(__VA_ARGS__) : nil

#endif /* TCategory_h */
