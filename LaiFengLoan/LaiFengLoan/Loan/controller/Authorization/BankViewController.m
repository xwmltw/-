//
//  BankViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "BankViewController.h"

@interface BankViewController ()

@end

@implementation BankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"银行卡绑定";
    [self initUI];
}
- (void)initUI{
    UITextField *textTF = [[UITextField alloc]init];
    textTF.placeholder = @"请输入您的手机号码";
    [textTF setFont:[UIFont systemFontOfSize:AdaptationWidth(16)]];
    textTF.textAlignment = NSTextAlignmentRight;
    [textTF setTextColor:LabelMainColor];
    [self.view addSubview:textTF];
    [textTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-18));
        make.top.mas_equalTo(self.view).offset(AdaptationWidth(22));
        make.height.mas_equalTo(AdaptationWidth(50));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"手机号";
    label.textColor = XColorWithRGB(89, 99, 109);
    label.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textTF);
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        
    }];
    
    UIView *line  = [[UIView alloc]init];
    line.backgroundColor = LineColor;
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textTF.mas_bottom).offset(AdaptationWidth(2));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.height.mas_equalTo(0.5);
    }];
    
    UITextField *textTF2 = [[UITextField alloc]init];
    textTF2.placeholder = @"请输入您的手机号码";
    [textTF2 setFont:[UIFont systemFontOfSize:AdaptationWidth(16)]];
    textTF2.textAlignment = NSTextAlignmentRight;
    [textTF2 setTextColor:LabelMainColor];
    [self.view addSubview:textTF2];
    [textTF2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-18));
        make.top.mas_equalTo(line.mas_bottom).offset(AdaptationWidth(2));
        make.height.mas_equalTo(AdaptationWidth(50));
    }];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"手机号";
    label2.textColor = XColorWithRGB(89, 99, 109);
    label2.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textTF2);
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        
    }];
    
    UIView *line2  = [[UIView alloc]init];
    line2.backgroundColor = LineColor;
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textTF2.mas_bottom).offset(AdaptationWidth(2));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.height.mas_equalTo(0.5);
    }];
    
    UITextField *textTF3 = [[UITextField alloc]init];
    textTF3.placeholder = @"请输入您的手机号码";
    [textTF3 setFont:[UIFont systemFontOfSize:AdaptationWidth(16)]];
    textTF3.textAlignment = NSTextAlignmentRight;
    [textTF3 setTextColor:LabelMainColor];
    [self.view addSubview:textTF3];
    [textTF3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-18));
        make.top.mas_equalTo(line2.mas_bottom).offset(AdaptationWidth(2));
        make.height.mas_equalTo(AdaptationWidth(50));
    }];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"手机号";
    label3.textColor = XColorWithRGB(89, 99, 109);
    label3.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textTF3);
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        
    }];
    
    UIView *line3  = [[UIView alloc]init];
    line3.backgroundColor = LineColor;
    [self.view addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textTF3.mas_bottom).offset(AdaptationWidth(2));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.height.mas_equalTo(0.5);
    }];
    
    UITextField *textTF4 = [[UITextField alloc]init];
    textTF4.placeholder = @"请输入您的手机号码";
    [textTF4 setFont:[UIFont systemFontOfSize:AdaptationWidth(16)]];
    textTF4.textAlignment = NSTextAlignmentRight;
    [textTF4 setTextColor:LabelMainColor];
    [self.view addSubview:textTF4];
    [textTF4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-18));
        make.top.mas_equalTo(line3.mas_bottom).offset(AdaptationWidth(2));
        make.height.mas_equalTo(AdaptationWidth(50));
    }];
    
    UILabel *label4 = [[UILabel alloc] init];
    label4.text = @"手机号";
    label4.textColor = XColorWithRGB(89, 99, 109);
    label4.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textTF4);
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        
    }];
    
    UIView *line4  = [[UIView alloc]init];
    line4.backgroundColor = LineColor;
    [self.view addSubview:line4];
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textTF4.mas_bottom).offset(AdaptationWidth(2));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.height.mas_equalTo(0.5);
    }];
    
    UITextField *textTF5 = [[UITextField alloc]init];
    textTF5.placeholder = @"请输入您的手机号码";
    [textTF5 setFont:[UIFont systemFontOfSize:AdaptationWidth(16)]];
    textTF5.textAlignment = NSTextAlignmentRight;
    [textTF5 setTextColor:LabelMainColor];
    [self.view addSubview:textTF5];
    [textTF5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-18));
        make.top.mas_equalTo(line4.mas_bottom).offset(AdaptationWidth(2));
        make.height.mas_equalTo(AdaptationWidth(50));
    }];
    
    UILabel *label5 = [[UILabel alloc] init];
    label5.text = @"手机号";
    label5.textColor = XColorWithRGB(89, 99, 109);
    label5.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textTF5);
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        
    }];
    
    UIView *line5  = [[UIView alloc]init];
    line5.backgroundColor = LineColor;
    [self.view addSubview:line5];
    [line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textTF5.mas_bottom).offset(AdaptationWidth(2));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.height.mas_equalTo(0.5);
    }];
    
    UIButton *autBtn = [[UIButton alloc]init];
    [autBtn setBorderWidth:1 andColor:AppMainColor];
    [autBtn setCornerValue:AdaptationWidth(22)];
    [autBtn setTitle:@"立即绑定" forState:UIControlStateNormal];
    [autBtn setBackgroundColor:XColorWithRGB(56, 123, 230)];
    [autBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autBtn];
    [autBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(AdaptationWidth(43));
        make.width.mas_equalTo(AdaptationWidth(250));
        make.bottom.mas_equalTo(self.view).offset(-AdaptationWidth(40));
    }];
    
    UILabel * compayLab = [[UILabel alloc]init];
    compayLab.numberOfLines = 0;
    [compayLab setText:[NSString stringWithFormat:@"每人限定3次尝试，失败将被锁定，请填写正确的银行卡号，预留手机号以及验证码。"]];
    [compayLab setFont:[UIFont systemFontOfSize:AdaptationWidth(12)]];
    [compayLab setTextColor:LabelMainColor];
    [self.view addSubview:compayLab];
    [compayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.bottom.mas_equalTo(autBtn.mas_top).offset(-AdaptationWidth(10));
    }];
    
}

- (void)btnOnClick:(UIButton *)btn{
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
