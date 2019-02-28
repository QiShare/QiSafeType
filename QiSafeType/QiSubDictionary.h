//
//  QiSubDictionary.h
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/25.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QiSubDictionary : NSDictionary

- (instancetype)initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt;
// + (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key;
+ (instancetype)dictionaryWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt;
- (NSUInteger)count;
- (id)objectForKey:(id)aKey;
- (NSEnumerator *)keyEnumerator;

- (id)objectForKeyedSubscript:(id)key ;

@end

NS_ASSUME_NONNULL_END
