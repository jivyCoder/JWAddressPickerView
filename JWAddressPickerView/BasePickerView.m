//
//  BasePickerView.m
//  JWAddressPickerViewExample
//
//  Created by jw on 2017/11/29.
//  Copyright © 2017年 jw. All rights reserved.
//

#import "BasePickerView.h"


#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

@interface BasePickerView ()<UIGestureRecognizerDelegate>
/** 确认 取消按钮所在的视图 */
@property (nonatomic, strong) UIView *barView;
/** 内容视图 */
@property (nonatomic, strong) UIView *contentView;
/** 内容高度 */
@property (nonatomic, assign) CGFloat contentHeight;
/** barViewHeight */
@property (nonatomic, assign) CGFloat barViewHeight;
/** btnWidth */
@property (nonatomic, assign) CGFloat btnWidth;


@end

@implementation BasePickerView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentHeight = 250;
        self.barViewHeight = 40;
        self.btnWidth = 50;
        self.bounds = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        [self addSubview:self.contentView];
        [self.barView addSubview:self.comfirmBtn];
        [self.barView addSubview:self.cancelBtn];
        [self.contentView addSubview:self.barView];
        [self.contentView addSubview:self.pickerView];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)];
        self.userInteractionEnabled = YES;
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        [self setupPickerView];
    }
    return self;
}
- (void)show {
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    self.center = [UIApplication sharedApplication].keyWindow.center;
    CGRect contentViewFrame = CGRectMake(0, kWindowH, kWindowW, self.contentHeight);
    contentViewFrame.origin.y -= self.contentView.frame.size.height;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.frame = contentViewFrame;
    } completion:^(BOOL finished) {
        
    }];
}
- (void)remove {
    
    CGRect contentViewFrame = self.contentView.frame;
    contentViewFrame.origin.y += self.contentView.frame.size.height;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.contentView.frame = contentViewFrame;
    } completion:^(BOOL finished) {
        [self.contentView removeFromSuperview];
        [self removeFromSuperview];
    }];
    
}
/** 子类实现的方法  */
- (void)setupPickerView {
    
}
/** 确认按钮点击事件 */
- (void)comfirmBtnClick {
    [self remove];
}
/** 取消按钮点击事件 */
- (void)cancelBtnClick {
    [self remove];
}
#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    return YES;
}
#pragma mark - lazy
- (UIView *)barView {
    if (!_barView) {
        _barView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, self.barViewHeight)];
//        _barView.backgroundColor = [UIColor redColor];
    }
    return _barView;
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kWindowH, kWindowW, self.contentHeight)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UIPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.barViewHeight, self.contentView.frame.size.width, self.contentView.frame.size.height - self.barViewHeight)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    }
    return _pickerView;
}
- (UIButton *)comfirmBtn {
    if (!_comfirmBtn) {
        _comfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _comfirmBtn.frame = CGRectMake(kWindowW - self.btnWidth, 0, self.btnWidth, self.barViewHeight);
        [_comfirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_comfirmBtn setTitle:@"确定" forState:UIControlStateNormal];
//        _comfirmBtn.backgroundColor = [UIColor yellowColor];
        [_comfirmBtn addTarget:self action:@selector(comfirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _comfirmBtn;
}
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(0, 0, self.btnWidth, self.barViewHeight);
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 1;
}
@end
