//
//  Person.h
//  QiAvoidCommonCrash
//
//  Created by wangyongwang on 2019/2/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
