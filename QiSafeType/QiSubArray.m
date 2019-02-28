//
//  QiSafeArray.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/24.
//  Copyright © 2019年 QiShare. All rights reserved.
//
// 

#import "QiSubArray.h"
#import <objc/runtime.h>

@interface QiSubArray ()

@property (nonatomic, copy) NSArray *safeSubArray;

@end

@implementation QiSubArray

- (instancetype)initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt {
    self = [super init];
    if (self) {
        _safeSubArray = [[NSArray alloc] initWithObjects:objects count:cnt];
    }
    return self;
}

- (NSUInteger)count {
    
    return _safeSubArray.count;
}

- (id)objectAtIndex:(NSUInteger)index {
    if (index >= _safeSubArray.count) {
        return nil;
    }
    return [_safeSubArray objectAtIndex:index];
}

@end
