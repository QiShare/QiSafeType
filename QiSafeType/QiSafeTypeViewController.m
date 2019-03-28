//
//  QiSafeTypeViewController.m
//  QiSafeType
//
//  Created by wangyongwang on 2019/2/22.
//  Copyright © 2019年 QiShare. All rights reserved.
//

#import "QiSafeTypeViewController.h"
#import "QiMessageForwardViewController.h"
#import "QiSafeTypeHandleViewController.h"
#import "QiSafeKVOViewController.h"

//#import "QiSubArray.h"
#import "QiSubDictionary.h"
#import <objc/runtime.h>
#import "QiAvoidCommonCrash/NSObject+QiAvoidCommonCrash.h"
#import "QiAvoidCommonCrash/NSDictionary+QiSafeType.h"
//#import "NSDictionary-NilSafe/NSDictionary+NilSafe.h"



@implementation QiSafeTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [NSString stringWithFormat:@"%@", nil];
}

- (void)setupUI {
    
    self.title = @"QiSafeType";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *messageForwardButton = [[UIButton alloc] initWithFrame:CGRectMake(.0, CGRectGetHeight(self.view.frame) * 0.2, CGRectGetWidth(self.view.frame), 40.0)];
    [self.view addSubview:messageForwardButton];
    messageForwardButton.backgroundColor = [UIColor blueColor];
    [messageForwardButton setTitle:@"去消息转发界面" forState:UIControlStateNormal];
    [messageForwardButton addTarget:self action:@selector(messageForwardDetailButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *safeTypeButton = [[UIButton alloc] initWithFrame:CGRectMake(.0, CGRectGetHeight(self.view.frame) * 0.4, CGRectGetWidth(self.view.frame), 40.0)];
    [self.view addSubview:safeTypeButton];
    safeTypeButton.backgroundColor = [UIColor blueColor];
    [safeTypeButton setTitle:@"去安全类型处理页面" forState:UIControlStateNormal];
    [safeTypeButton addTarget:self action:@selector(qiSafeTypeHandleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *kvoButton = [[UIButton alloc] initWithFrame:CGRectMake(.0, CGRectGetHeight(self.view.frame) * 0.6, CGRectGetWidth(self.view.frame), 40.0)];
    [self.view addSubview:kvoButton];
    kvoButton.backgroundColor = [UIColor blueColor];
    [kvoButton setTitle:@"避免KVO崩溃" forState:UIControlStateNormal];
    [kvoButton addTarget:self action:@selector(qiSafeKVOButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)messageForwardDetailButtonClicked {
    
    QiMessageForwardViewController *messageForwardVC = [QiMessageForwardViewController new];
    [self.navigationController pushViewController:messageForwardVC animated:YES];
}

- (void)qiSafeTypeHandleButtonClicked {
    
    QiSafeTypeHandleViewController *safeTypeHandleVC = [QiSafeTypeHandleViewController new];
    [self.navigationController pushViewController:safeTypeHandleVC animated:YES];
}

- (void)qiSafeKVOButtonClicked:(UIButton *)sender {
    
    QiSafeKVOViewController *kvoVC = [QiSafeKVOViewController new];
    [self.navigationController pushViewController:kvoVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self qiSafeDictionary];
    [self qiSafeArray];
}

- (void)qiSafeArray {
    
    NSString *nilValue = nil;
    // 声明数组的时候 插入nil
    NSArray *qiArr = @[@"qishare0", nilValue, @"qiShare2"];
    NSLog(@"qiArr：%@", qiArr);
    // NSLog(@"qiArr[0]：%@ qiArr[1]：%@ qiArr[2]：%@",qiArr[0],qiArr[1],qiArr[2]);
    
    objc_getClass(NSStringFromClass([NSArray class]).UTF8String);
    /**
     qiArr：(
        qishare0,
        qiShare2
     )
     */
    
    id tempValue = nil;
    
    NSArray *qiArr0 = @[];
    tempValue = qiArr0[0];
    tempValue = qiArr0[1];
    
    NSArray *qiArr1 = @[@1];
    tempValue = qiArr1[0];
    tempValue = qiArr1[1];
    
   
    NSArray *qiArr2 = @[@1, @2];
    tempValue = qiArr2[1];
    tempValue = qiArr2[2];
    
    NSLog(@"qiArr0 class：%@", NSStringFromClass([qiArr0 class]));
    NSLog(@"qiArr1 class：%@", NSStringFromClass([qiArr1 class]));
    NSLog(@"qiArr2 class：%@", NSStringFromClass([qiArr2 class]));
    
    NSArray *qiArr3 = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    
    NSLog(@"qiArr3 class：%@", NSStringFromClass([qiArr3 class]));
    
    /**
      qiArr0 class：__NSArray0
      qiArr1 class：__NSSingleObjectArrayI
      qiArr2 class：__NSArrayI
      qiArr3：__NSArrayI
     */
    
    NSMutableArray *mQiArr0 = [@[] mutableCopy];
    tempValue = mQiArr0[0];
    tempValue = mQiArr0[1];
    NSLog(@"mQiArr0 class：%@",NSStringFromClass([mQiArr0 class]));
    
    NSMutableArray *mQiArr1 = [@[@"1"] mutableCopy];
    tempValue = mQiArr1[0];
    tempValue = mQiArr1[1];
    NSLog(@"mQiArr1 class：%@", NSStringFromClass([mQiArr1 class]));
    
    NSMutableArray *mQiArr2 = [@[@"1", @2] mutableCopy];
    tempValue = mQiArr2[0];
    tempValue = mQiArr2[1];
    tempValue = mQiArr2[2];
    NSLog(@"mQiArr2 class：%@",NSStringFromClass([mQiArr2 class]));
    
    /**
      mQiArr0 class：__NSArrayM
      mQiArr1 class：__NSArrayM
      mQiArr2 class：__NSArrayM
     */
    
    
    /**
    NSMutableDictionary *mDict = [@{@"aKey": @"aValue"} mutableCopy];
    mDict[@"aKey"] = nil;
    NSArray *arr = @[@1];
    objc_getClass(NSStringFromClass([arr class]).UTF8String);
    objc_getClass(NSStringFromClass([[NSArray array]class]).UTF8String);
     */
    
    /** qi_safeIntegerValue
    id number = @(1);
    [number qi_safeIntegerValue];
     */
    
    /** qi_safeArrayObjectAtIndex
    NSArray *arr = @[@1];
    [arr qi_safeArrayObjectAtIndex:-1];
    [arr qi_safeArrayObjectAtIndex:0];
    [arr qi_safeArrayObjectAtIndex:1];
     */
    
    /** qi_safeDictionaryValueForkey
    id abc = @[];
    [abc qi_safeDictionaryValueForkey:@"aa"];
     */
    
    /** qi_safeValueForkey
    NSDictionary *dict = @{@"aKey": @"aValue"};
    [dict qi_safeValueForkey:@"aKey"];
    [dict qi_safeValueForkey:@"bKey"];
    */
    
    /** QiSafeArray
    NSString *values[3];
    values[0] = @"1";
    values[1] = @"2";
    values[2] = @"3";
    QiSubArray *subArr = [[QiSubArray alloc] initWithObjects:values count:3];
    subArr[1];
    subArr[2];
    
    object_getClassName(subArr);
    class_getName([subArr class]);
    id allocArr = [NSArray alloc];
    NSMutableArray *mArr = [NSMutableArray array];
    [mArr qi_safeObjectAtIndex:2];
    NSLog(@"mArr：%@", objc_getClass(NSStringFromClass([mArr class]).UTF8String));
    */
}

- (void)qiSafeDictionary {
    
    NSString *nilValue = nil;
    
    NSDictionary *qiDict0 = [NSDictionary new];
    NSDictionary *qiDict1 = @{@"key1": @"value1"};
    
    NSDictionary *qiDict2 = @{@"key1": @"value1", @"key2": @"value2"};
    
    NSLog(@"dict0：%@", NSStringFromClass([qiDict0 class]));
    NSLog(@"dict1：%@", NSStringFromClass([qiDict1 class]));
    NSLog(@"dict2：%@", NSStringFromClass([qiDict2 class]));
    
    NSString *objects[3];
    objects[0] = @"aKey";
    objects[1] = @"bKey";
    objects[2] = @"cKey";
    NSString *keys[3];
    keys[0] = @"aValue";
    keys[1] = @"bValue";
    keys[2] = @"cValue";
    NSDictionary *qiDict3 = [[NSDictionary alloc] initWithObjects:objects forKeys:keys count:3];
    NSLog(@"dict3：%@", NSStringFromClass([qiDict3 class]));
    
    NSDictionary *qiDict4 = @{@"nilKey": @"nilValue", @"nilKey": nilValue, @"non_nilKey": @"nonNilValue"};
    NSLog(@"%@", qiDict4);
    
    NSMutableDictionary *mQiDict = [@{@"nilKey": nilValue} mutableCopy];
    mQiDict = [NSMutableDictionary dictionary];
    [mQiDict setObject:nilValue forKey:@"nilKey"];
    /**
     dict0：__NSDictionary0
     dict1：__NSSingleEntryDictionaryI
     dict2：__NSDictionaryI
     dict3：__NSDictionaryI
     */
    /**
     
     QiSubDictionary *dict = (QiSubDictionary *)@{@"aKey": @"aValue", @"bKey": @"bValue"};
     
     dict = [[QiSubDictionary alloc] initWithObjects:objects forKeys:keys count:3];
     [dict valueForKey:@""];
     id null = [NSNull null];
     tempValue = dict[null];
     tempValue = dict[@"aKey"];
     tempValue =  dict[@"bKey"];
     */
}

@end
