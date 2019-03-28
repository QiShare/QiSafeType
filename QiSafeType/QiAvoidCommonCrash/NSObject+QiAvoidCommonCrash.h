//
//  NSObject+QiAvoidCommonCrash.h
//  QiAvoidCommonCrash
//
//  Created by wangyongwang on 2019/2/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (QiAvoidCommonCrash)

- (NSInteger)qi_safeIntegerValue;
- (id)qi_safeArrayObjectAtIndex:(NSUInteger)index;
- (void)qi_safeMutableArrayAddObject:(id)obj;
- (id)qi_safeDictionaryValueForkey:(NSString *)key;
- (void)qi_safeAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
- (void)qi_safeRemoveObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSString (QiAvoidCommonCrash)

+ (NSString *)qi_safeNilStringSourceString:(NSString *)sourceStr DestinationDefaultString:(NSString *)destinationDefaultStr;
+ (NSString *)qi_safeFormat:(NSString *)format;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSArray (QiAvoidCommonCrash)

- (id)qi_safeObjectAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (QiAvoidCommonCrash)

- (void)qi_safeAddObject:(id)obj;
- (void)qi_safeAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
- (void)qi_safeRemoveObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (QiAvoidCommonCrash)

- (id)qi_safeValueForkey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
