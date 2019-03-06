//
//  EditItemViewController.m
//  WhatToDoNext
//
//  Created by ysj on 2018/7/18.
//  Copyright © 2018年 ysj. All rights reserved.
//

#import "EditItemViewController.h"
#import "Common.h"
#import "UIFont+YSJ.h"
#import "UIImage+YSJ.h"
#import "UIColor+YSJ.h"
#import "Masonry.h"
#import "UIButton+YSJ.h"
#import "ReactiveObjC.h"

@interface EditItemViewController ()<UITextFieldDelegate>

@property (nonatomic, assign) EditType editType;


@end

@implementation EditItemViewController

// MARK: - LifeCircle Method
- (instancetype)initWithEditType:(EditType)editType {
    if (self = [super init]) {
        self.editType = editType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavigation];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// MARK: - Init Method
- (void)initNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:TintColor] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_close"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemClick)];
    rightBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)initViews {
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = [UIFont fontR:UIScale(18)];
    nameLabel.textColor = TextNormalColor;
    nameLabel.text = @"吃吃的名字:";
    [self.view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(UIScale(20));
        make.right.equalTo(self.view).offset(UIScale(-20));
        make.height.mas_equalTo(UIScale(30));
        make.top.equalTo(self.view).offset(UIScale(50));
    }];
    
    
    UITextField *nameTextField = [self formatTextField];
    nameTextField.placeholder = @"请输入吃吃的名字";
    [self.view addSubview:nameTextField];
    [nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel).offset(UIScale(-5));
        make.height.mas_equalTo(UIScale(40));
        make.top.equalTo(nameLabel.mas_bottom).offset(UIScale(10));
        make.right.equalTo(nameLabel);
    }];
    
    
    UILabel *weightLabel = [[UILabel alloc]init];
    weightLabel.font = [UIFont fontR:UIScale(18)];
    weightLabel.textColor = TextNormalColor;
    weightLabel.text = @"权重:";
    [self.view addSubview:weightLabel];
    [weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.right.equalTo(nameLabel);
        make.height.equalTo(nameLabel);
        make.top.equalTo(nameTextField.mas_bottom).offset(UIScale(20));
    }];
    
    UITextField *weightTextField = [self formatTextField];
    weightTextField.placeholder = @"请输入权重";
    weightTextField.keyboardType = UIKeyboardTypeNumberPad;
    weightTextField.delegate = self;
    [self.view addSubview:weightTextField];
    [weightTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weightLabel).offset(UIScale(-5));
        make.height.mas_equalTo(UIScale(40));
        make.top.equalTo(weightLabel.mas_bottom).offset(UIScale(10));
        make.right.equalTo(weightLabel);
    }];
    
    UIButton *sureBtn = [[UIButton alloc]init];
    [sureBtn setBackgroundColor:TintColor forState:UIControlStateNormal];//[UIColor lightTextColor]
    [sureBtn setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [sureBtn setTitle:@"确  定" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont fontR:UIScale(17)];
    sureBtn.layer.cornerRadius = EatCellHeight / 2;
    sureBtn.layer.shadowOffset = CGSizeMake(3, 3);
    sureBtn.layer.shadowOpacity = 0.7;
    sureBtn.layer.shadowRadius = 3;
    sureBtn.clipsToBounds = YES;
    sureBtn.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(EatCellHeight);
        make.width.mas_equalTo(ScreenWidth / 2);
        make.top.equalTo(weightTextField.mas_bottom).offset(UIScale(20));
    }];
    RAC(sureBtn, enabled) = [RACSignal combineLatest:@[nameTextField.rac_textSignal, weightTextField.rac_textSignal] reduce:^id _Nonnull (NSString *nameText, NSString *weightText) {
        return @((nameText.length) > 0 && (weightText.length > 0));
    }];
    @weakify(self)
    [[sureBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self)
        if (self.editType == TypeEdit) {
            if (self.itemModel) {
                self.itemModel.name = nameTextField.text;
                self.itemModel.weight = [weightTextField.text intValue];
                [[NSNotificationCenter defaultCenter] postNotificationName:EditItemModelNotificationName object:nil userInfo:@{@"itemModel": self.itemModel}];
            }
        } else {
            ItemModel *model = [ItemModel itemModelWithName:nameTextField.text weight:[weightTextField.text intValue]];
            [[NSNotificationCenter defaultCenter] postNotificationName:AddItemModelNotificationName object:nil userInfo:@{@"itemModel": model}];
        }
        [self rightBarItemClick];
    }];
    
    [nameTextField becomeFirstResponder];
    
    if (self.editType == TypeEdit) {
        [self setTitle:@"修改条目" titleColor:[UIColor whiteColor] titleFont:[UIFont fontR:UIScale(18)]];
        if (self.itemModel) {
            nameTextField.text = self.itemModel.name;
            weightTextField.text = [NSString stringWithFormat:@"%d", self.itemModel.weight];
        }
    } else {
        [self setTitle:@"新增条目" titleColor:[UIColor whiteColor] titleFont:[UIFont fontR:UIScale(18)]];
    }
}

- (UITextField *)formatTextField {
    UITextField *textField = [[UITextField alloc]init];
    textField.tintColor = TintColor;
    textField.textColor = TextNormalColor;
    textField.font = [UIFont fontR:UIScale(18)];
    textField.layer.cornerRadius = UIScale(UIScale(5));
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScale(4), 1)];
    return textField;
}

- (BOOL)isNumber:(NSString *)string {
    NSString *emailRegex = @"^[0-9]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:string];
}

// MARK: - UITextField Delegate Method
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [self isNumber:string];
}

// MARK: - Click Selector Method
- (void)rightBarItemClick {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
