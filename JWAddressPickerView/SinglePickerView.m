//
//  SinglePickerView.m
//  JWAddressPickerViewExample
//
//  Created by jw on 2017/11/29.
//  Copyright © 2017年 jw. All rights reserved.
//

#import "SinglePickerView.h"

@interface SinglePickerView ()
/** 选中的字符串 */
@property (nonatomic, copy, nullable)NSString *selectedTitle;
/** 选中的数组下标 */
@property (nonatomic, assign) NSInteger index;
/** 数据数组 */
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation SinglePickerView

+(instancetype)showWithDataArray:(NSArray *)array block:(selectedBlock)block {
    SinglePickerView *pick = [[SinglePickerView alloc] init];
    [pick setDataArray:array];
    [pick show];
    pick.block = block;
    return pick;
}

- (void)setupPickerView {
    [super setupPickerView];
    _index = 0;
}
- (void)show {
    [super show];
    if (self.dataArray.count>0) {
        [self.pickerView selectRow:0 inComponent:0 animated:NO];
    }
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.frame.size.width;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedTitle = self.dataArray[row];
    self.index = row;
}
/** 设置row文本的样式 */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = 1;
    label.text = self.dataArray[row];
    return label;
}
#pragma mark -点击确定按钮
- (void)comfirmBtnClick{
    if (self.block) {
        self.block(self.selectedTitle,self.index);
    }
    [super comfirmBtnClick];
}
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    _selectedTitle = dataArray.firstObject;
    _index = 0;
    [self.pickerView reloadAllComponents];
}

@end
