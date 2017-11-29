# PickerView
封装好的地址选择器 使用类方法调用 方便快捷

1.单数组调用方法,只需传一个数组即可 
```
 NSArray *array = @[@"哈哈",@"我",@"你们",@"他",@"哎呦,不错哦",@"也是醉了",@"嗯呢",@"叮咚",@"xxx",@"xxxx",@"666666",@"6翻了"];
 [SinglePickerView showWithDataArray:array block:^(NSString *str, NSInteger index) {
        [btn setTitle:str forState:UIControlStateNormal];
 }];
```
2地址选择器调用方法
```
[JWAddressPickerView showWithAddressBlock:^(NSString *province, NSString *city, NSString *area) {
        NSString *title = [NSString stringWithFormat:@"%@-%@-%@",province,city,area];
        [btn setTitle:title forState:UIControlStateNormal];
    }];
```
