//
//  QiSafeArray.h
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/24.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QiSubArray : NSArray

- (instancetype)initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt;
- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
