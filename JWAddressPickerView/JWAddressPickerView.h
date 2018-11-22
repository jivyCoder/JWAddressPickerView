//
//  JWAddressPickView.h
//  JWAddressPickerViewExample
//
//  Created by jw on 2017/11/29.
//  Copyright © 2017年 jw. All rights reserved.
//

#import "BasePickerView.h"

typedef void(^AddressBlcok)(NSString *province,NSString *city,NSString *area);
@interface JWAddressPickerView : BasePickerView
/** 回调block */
@property (nonatomic, copy) AddressBlcok addressBlock;
+ (instancetype)showWithAddressBlock:(AddressBlcok)block;
@end
