//
//  Person.m
//  QiAvoidCommonCrash
//
//  Created by wangyongwang on 2019/2/12.
//

#import "Person.h"

@implementation Person

+ (instancetype)sharedInstance {
    
    static Person *person;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        person = [[Person alloc] init];
    });
    return person;
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"%s--%@", __FUNCTION__, change);
}

- (void)dealloc {
    
    NSLog(@"%s", __FUNCTION__);
}


@end
