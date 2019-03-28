//
//  QiSafeKVOViewController.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/3/12.
//  Copyright © 2019年 QiShare. All rights reserved.
//
// https://github.com/facebook/KVOController

#import "QiSafeKVOViewController.h"
#import "Person.h"
#import "NSObject+QiAvoidCommonCrash.h"
// #import "FBKVOController/NSObject+FBKVOController.h"
#import "NSObject+FBKVOController.h"

@interface QiSafeKVOViewController ()

@property (nonatomic, copy) NSString *kvoName;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) FBKVOController *fbKvoController;

@end

@implementation QiSafeKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SafeKVO";
    
    [self setupUI];
    
    _person = [Person new];
    // [self systemKVOUse];
    [self fbKVO];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *changePersonNameAddressSelfNameBtn = [UIButton new];
    changePersonNameAddressSelfNameBtn.backgroundColor = [UIColor blueColor];
    [changePersonNameAddressSelfNameBtn setTitle:@"改变PersonNameAddressSelfName" forState:UIControlStateNormal];
    [self.view addSubview:changePersonNameAddressSelfNameBtn];
    changePersonNameAddressSelfNameBtn.frame = CGRectMake(.0, .0, CGRectGetWidth(self.view.frame), 40.0);
    changePersonNameAddressSelfNameBtn.center = self.view.center;
    [changePersonNameAddressSelfNameBtn addTarget:self action:@selector(changePersonNameAddressSelfNameButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"SystemKVOChange：%@", change);
}

- (void)systemKVOUse {
    
    [_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionInitial context:nil];
}

- (void)fbKVO {
    
    [self.KVOController observe:_person keyPath:FBKVOKeyPath(_person.name) options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        NSLog(@"%@", change);
    }];
    
    [self.KVOController observe:_person keyPath:FBKVOClassKeyPath(Person, address) options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        NSLog(@"%@", change);
    }];
    
    [self.KVOControllerNonRetaining observe:self keyPath:FBKVOKeyPath(self.name) options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        NSLog(@"%@", change);
    }];
}


- (void)dealloc {
    
    // [_person removeObserver:self forKeyPath:@"name"];
    NSLog(@"%s", __FUNCTION__);
}


- (void)hashMapHashTable {
    
    // NSHashTable *hashTable = [NSHashTable weakObjectsHashTable];
    
    // weakKeyStrongObjectsMapTable
    NSMapTable *weakKeyStrongObjectsMapTable = [NSMapTable weakToStrongObjectsMapTable];
    // 相当于
    /**
    NSPointerFunctionsOptions weakOptions = NSPointerFunctionsWeakMemory | NSPointerFunctionsObjectPointerPersonality;
    NSPointerFunctionsOptions strongOptions = NSPointerFunctionsStrongMemory | NSPointerFunctionsObjectPointerPersonality;
    weakKeyStrongObjectsMapTable = [NSMapTable mapTableWithKeyOptions:weakOptions valueOptions:strongOptions];
     */
    
    NSObject *key0 = [NSObject new];
    NSObject *obj0 = [NSObject new];
    [weakKeyStrongObjectsMapTable setObject:obj0 forKey:key0];
    NSLog(@"weakKeyStrongObjectsMapTable：%@", weakKeyStrongObjectsMapTable);
    /*
     weakKeyStrongObjectsMapTable：NSMapTable {
     [3] <NSObject: 0x600001711180> -> <NSObject: 0x600001711190>
     }
     */
    key0 = nil;
    NSLog(@"key0 =nil, weakKeyStrongObjectsMapTable：%@", weakKeyStrongObjectsMapTable);
    /*
     key0 =nil, weakKeyStrongObjectsMapTable：NSMapTable {
     }
     */
    
    // weakKeyWeakObjsMapTable
    NSObject *key1 = [NSObject new];
    NSObject *obj1 = [NSObject new];
    NSObject *key2 = [NSObject new];
    NSObject *obj2 = [NSObject new];
    
    NSMapTable *weakKeyWeakObjsMapTable = [NSMapTable weakToWeakObjectsMapTable];
    // 相当于
    // weakKeyWeakObjsMapTable = [NSMapTable mapTableWithKeyOptions:weakOptions valueOptions:weakOptions];
    [weakKeyWeakObjsMapTable setObject:obj1 forKey:key1];
    [weakKeyWeakObjsMapTable setObject:obj2 forKey:key2];
    NSLog(@"weakKeyWeakObjsMapTable：%@", weakKeyWeakObjsMapTable);
    /*
     weakKeyWeakObjsMapTable：NSMapTable {
     [3] <NSObject: 0x600001711180> -> <NSObject: 0x600001710fa0>
     [10] <NSObject: 0x6000017111a0> -> <NSObject: 0x6000017110b0>
     }
     */
    
    key1 = nil;
    NSLog(@"key1 = nil, weakKeyWeakObjsMapTable：%@", weakKeyWeakObjsMapTable);
    /*
     key1 = nil, weakKeyWeakObjsMapTable：NSMapTable {
     [10] <NSObject: 0x6000017111a0> -> <NSObject: 0x6000017110b0>
     }
     */
    [self.KVOControllerNonRetaining observe:self keyPath:@"name" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        
    }];
    obj2 = nil;
    [weakKeyWeakObjsMapTable setObject:obj1 forKey:key1];
    NSLog(@"obj2 = nil, weakKeyWeakObjsMapTable：%@", weakKeyWeakObjsMapTable);
    /*
     obj2 = nil, weakKeyWeakObjsMapTable：NSMapTable {
     }
     */
    
    // EINVAL; EAGAIN;
    
    // NSHashTable
    NSHashTable *hashTable = [NSHashTable weakObjectsHashTable];
    // 相当于
    [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory | NSPointerFunctionsObjectPointerPersonality];
    NSObject *hashObj = [NSObject new];
    [hashTable addObject:hashObj];
    NSLog(@"hashTable：%@", hashTable);
    /*
     hashTable：NSHashTable {
     [11] <NSObject: 0x600002528af0>
     }
     */
    hashObj = nil;
    NSLog(@"hashObj = nil, hashTable：%@", hashTable);
    /*
     hashObj = nil, hashTable：NSHashTable {
     }
     */
}

- (void)changePersonNameAddressSelfNameButtonClicked:(UIButton *)sender {
    
    _person.name = [NSString stringWithFormat:@"personName:QiShare_%u", arc4random() % 1000];
    _person.address = [NSString stringWithFormat:@"personAddress:QiShare_%u", arc4random() % 1000];
    
    self.name = [NSString stringWithFormat:@"selfName:QiShare_%u", arc4random() % 1000];
}

@end
