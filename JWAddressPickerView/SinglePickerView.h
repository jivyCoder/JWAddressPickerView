//
//  SinglePickerView.h
//  JWAddressPickerViewExample
//
//  Created by jw on 2017/11/29.
//  Copyright © 2017年 jw. All rights reserved.
//

#import "BasePickerView.h"
typedef void(^selectedBlock)(NSString *str,NSInteger index);
/** 单列的pickerView 传一个数组即可 */
@interface SinglePickerView : BasePickerView
/** 回调block */
@property (nonatomic, copy) selectedBlock block;
/** 使用类方法创建 传一个数组即可 str为选中的字符串 index为字符串对应数组元素的下标 (比如 要显示的值为广州  发请求的时候取code  这时就可以用到index来取值了) */
+ (instancetype)showWithDataArray:(NSArray *)array block:(selectedBlock)block;
@end
