//
//  ViewController.m
//  JWAddressPickerViewExample
//
//  Created by jw on 2017/11/29.
//  Copyright © 2017年 jw. All rights reserved.
//

#import "ViewController.h"
#import "SinglePickerView.h"
#import "JWAddressPickerView.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake((self.view.frame.size.width - 100) * 0.5, 100, 100, 40);
    [testBtn setTitle:@"点我有惊喜" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
    UIButton *addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addressBtn.frame = CGRectMake((self.view.frame.size.width - 200) * 0.5, 200, 200, 40);
    [addressBtn setTitle:@"点我选地址" forState:UIControlStateNormal];
    [addressBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addressBtn addTarget:self action:@selector(addressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addressBtn];
    
}
/** 类方法调用 */
- (void)testBtnClick:(UIButton *)btn {
    NSArray *array = @[@"哈哈",@"我",@"你们",@"他",@"哎呦,不错哦",@"也是醉了",@"嗯呢",@"叮咚",@"xxx",@"xxxx",@"666666",@"6翻了"];
    [SinglePickerView showWithDataArray:array block:^(NSString *str, NSInteger index) {
        [btn setTitle:str forState:UIControlStateNormal];
    }];
}

/** 类方法调用 */
- (void)addressBtn:(UIButton *)btn {
    [JWAddressPickerView showWithAddressBlock:^(NSString *province, NSString *city, NSString *area) {
        NSString *title = [NSString stringWithFormat:@"%@-%@-%@",province,city,area];
        [btn setTitle:title forState:UIControlStateNormal];
    }];
}


@end
