//
//  JWAddressPickView.m
//  JWAddressPickerViewExample
//
//  Created by jw on 2017/11/29.
//  Copyright © 2017年 jw. All rights reserved.
//

#import "JWAddressPickerView.h"

@interface JWAddressPickerView ()

@property (nonatomic, strong) NSDictionary *pickerDic;
/** 以后扩展功能会用到(记住选中的地址...待完善) */
@property (nonatomic, strong) NSArray *selectedArray;
/** 省份数组 */
@property (nonatomic, strong) NSArray *provinceArray;
/** 城市数组 */
@property (nonatomic, strong) NSArray *cityArray;
/** 地区数组 */
@property (nonatomic, strong) NSArray *townArray;
/** 省 */
@property (nonatomic,copy) NSString *province;
/** 市 */
@property (nonatomic,copy) NSString *city;
/** 区 */
@property (nonatomic,copy) NSString *area;
@end

@implementation JWAddressPickerView

+ (instancetype)showWithAddressBlock:(AddressBlcok)block {
    JWAddressPickerView *pickerView = [[JWAddressPickerView alloc] init];
    pickerView.addressBlock = block;
    [pickerView show];
    return pickerView;
}

- (void)setupPickerView {
    [super setupPickerView];
    [self loadAddressData];
}
- (void)loadAddressData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JWAddress" ofType:@"plist"];
    self.pickerDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.provinceArray = [self.pickerDic valueForKey:@"p"];
    self.selectedArray = self.pickerDic[@"c"][self.provinceArray.firstObject];
    self.cityArray = self.selectedArray;
    self.townArray = self.pickerDic[@"a"][@"北京市-北京市"];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        return [self.cityArray objectAtIndex:row];
    } else {
        return [self.townArray objectAtIndex:row];
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.frame.size.width/3;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectedArray = self.pickerDic[@"c"][self.provinceArray[row]];
        self.province = self.provinceArray[row];
        if (self.selectedArray.count > 0) {
            self.cityArray = self.selectedArray;
        } else {
            self.cityArray = @[];
        }
        if (self.cityArray.count > 0) {
            self.townArray = self.pickerDic[@"a"][[NSString stringWithFormat:@"%@-%@",self.province,self.cityArray.firstObject]];
        } else {
            self.townArray = @[];
        }
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    if (component == 1) {
        self.townArray = self.pickerDic[@"a"][[NSString stringWithFormat:@"%@-%@",self.province,self.cityArray[row]]];
        self.city = self.cityArray[row];
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    if (component == 2) {
        self.area = self.townArray[row];
    }
    
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
#pragma mark - 点击确定按钮
- (void)comfirmBtnClick {
    NSInteger selectProvince = [self.pickerView selectedRowInComponent:0];
    NSInteger selectCity     = [self.pickerView selectedRowInComponent:1];
    NSInteger selectArea     = [self.pickerView selectedRowInComponent:2];
    self.province = self.provinceArray[selectProvince];
    self.city = self.cityArray[selectCity];
    self.area = self.townArray[selectArea];
    if (self.addressBlock) {
        self.addressBlock(self.province,self.city,self.area);
    }
    [super comfirmBtnClick];
}

@end
