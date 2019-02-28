//
//  QiSubDictionary.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/25.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import "QiSubDictionary.h"

@interface QiSubDictionary ()

@property (nonatomic, copy) NSDictionary *qiSafeDictionary;

@end

@implementation QiSubDictionary

- (instancetype)initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
    
    self = [super init];
    if (self) {
        _qiSafeDictionary = [[NSDictionary alloc] initWithObjects:objects forKeys:keys count:cnt];
    }
    return self;
}

- (NSUInteger)count {
    
    return self.qiSafeDictionary.allKeys.count;
}

- (id)objectForKey:(id)aKey {
    
    return [self.qiSafeDictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator {
    
    return [self.qiSafeDictionary keyEnumerator];
}

- (id)objectForKeyedSubscript:(id)key  {
    if(!key)
        return nil;
    return [self objectForKeyedSubscript:key];
}

- (id)valueForKey:(NSString *)key {
    
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [self.qiSafeDictionary valueForKey:key];
}

+ (instancetype)dictionaryWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j ++;
    }
    return (QiSubDictionary *)@{@"aKey": @"aValue"};
}

+ (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key {
    
    if (!key || !object) {
        return nil;
    }
    return (QiSubDictionary *)[NSDictionary dictionaryWithObject:object forKey:key];
}

@end
