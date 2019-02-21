//
//  NSObject+QiAvoidCommonCrash.m
//  QiAvoidCommonCrash
//
//  Created by wangyongwang on 2019/2/12.
//

#import "NSObject+QiAvoidCommonCrash.h"

//! 服务端返回数值类型有误
static NSInteger const kCustomErrorCode = 1000;
#if DEBUG

@implementation NSObject (QiAvoidCommonCrash)



- (NSInteger)qi_safeIntegerValue {
    
    if ([self isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)self) integerValue];
    } else if([self isKindOfClass:[NSString class]]) {
        return [((NSString *)self) integerValue];
    } else {
        return kCustomErrorCode;
    }
}

@end


@implementation NSString (QiAvoidCommonCrash)

+ (NSString *)qi_safeNilStringSourceString:(NSString *)sourceStr DestinationDefaultString:(NSString *)destinationDefaultStr {
    
    if (!sourceStr) {
        return destinationDefaultStr;
    }
    if ([sourceStr isKindOfClass:[NSString class]]) {
        if (sourceStr.length == 0) {
            if (destinationDefaultStr) {
                return destinationDefaultStr;
            }
        } else {
            return sourceStr;
        }
    }
    return nil;
}

- (NSString *)qi_safeNilStringDestinationDefaultString:(NSString *)destinationDefaultStr {
    
    if (!self) {
        return destinationDefaultStr;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if (self.length == 0) {
            if (destinationDefaultStr) {
                return destinationDefaultStr;
            }
        } else {
            return self;
        }
    }
    return nil;
}

+ (NSString *)qi_safeFormat:(NSString *)format {
    
    if (![format isKindOfClass:[NSString class]]) {
        return @"";
    }
    if (format) {
        return format;
    }
    return @"";
}

@end


@implementation NSArray (QiAvoidCommonCrash)

- (id)qi_safeObjectAtIndex:(NSUInteger)index {
    
    if (![self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    if (index < 0) {
        return nil;
    }
    
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex:index];
}

@end


@implementation NSMutableArray (QiAvoidCommonCrash)

- (void)qi_safeAddObject:(id)obj {
    
    if (!obj) {
        return;
    }
    if ([obj isKindOfClass:[NSNull class]]) {
        return;
    }
    [self addObject:obj];
}

@end


@implementation NSDictionary (QiAvoidCommonCrash)

- (id)qi_safeValueForkey:(NSString *)key {
    
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [self valueForKey:key];
}

@end

#endif
