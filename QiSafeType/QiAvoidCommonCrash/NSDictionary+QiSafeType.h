//
//  NSDictionary+QiSafeType.h
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/25.
//  Copyright © 2019年 QiShare. All rights reserved.
//
// 参考学习网址：https://github.com/allenhsu/NSDictionary-NilSafe

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (QiSafeType)

+ (void)swapMethod;

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (QiSafeType)

+ (void)swapMethod;

@end

NS_ASSUME_NONNULL_END
