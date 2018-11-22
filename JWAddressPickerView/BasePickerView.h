//
//  BasePickerView.h
//  JWAddressPickerViewExample
//
//  Created by jw on 2017/11/29.
//  Copyright © 2017年 jw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePickerView : UIView<UIPickerViewDataSource, UIPickerViewDelegate>
/** 确认按钮 */
@property (nonatomic, strong) UIButton *comfirmBtn;
/** 取消按钮 */
@property (nonatomic, strong) UIButton *cancelBtn;
/** pickerView */
@property (nonatomic, strong) UIPickerView *pickerView;
/** 子类实现的方法  */
- (void)setupPickerView;
/** 确认按钮点击事件 */
- (void)comfirmBtnClick;
/** 取消按钮点击事件 */
- (void)cancelBtnClick;
/** 弹出页面 */
- (void)show;
@end
