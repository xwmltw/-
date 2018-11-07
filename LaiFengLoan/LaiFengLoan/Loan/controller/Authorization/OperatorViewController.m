//
//  OperatorViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "OperatorViewController.h"
#import "AuthorizationHeadView.h"

@interface OperatorViewController ()

@end

@implementation OperatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"运营商认证";
    [self initUI];
}
- (void)initUI{
    AuthorizationHeadView *headView = [[AuthorizationHeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, AdaptationWidth(90))];
    [self.view addSubview:headView];
    
    UITextField *telTF = [[UITextField alloc]init];
    telTF.placeholder = @"请输入您的手机号码";
    [telTF setFont:[UIFont systemFontOfSize:AdaptationWidth(16)]];
    telTF.textAlignment = NSTextAlignmentRight;
    [telTF setTextColor:LabelMainColor];
    [self.view addSubview:telTF];
    [telTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-18));
        make.top.mas_equalTo(headView.mas_bottom).offset(AdaptationWidth(22));
        make.height.mas_equalTo(AdaptationWidth(50));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"手机号";
    label.textColor = XColorWithRGB(89, 99, 109);
    label.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(telTF);
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        
    }];
    
    
    
    UIView *line  = [[UIView alloc]init];
    line.backgroundColor = LineColor;
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(telTF.mas_bottom).offset(AdaptationWidth(2));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.height.mas_equalTo(0.5);
    }];
    
    UITextField *pwdTF = [[UITextField alloc]init];
    [pwdTF setFont:[UIFont systemFontOfSize:AdaptationWidth(16)]];
    pwdTF.placeholder = @"请输入该手机号的服务密码";
    pwdTF.textAlignment = NSTextAlignmentRight;
    [pwdTF setTextColor:LabelMainColor];
    [self.view addSubview:pwdTF];
    [pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-18));
        make.top.mas_equalTo(line.mas_bottom).offset(AdaptationWidth(2));
        make.height.mas_equalTo(AdaptationWidth(50));
    }];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"服务密码";
    label2.textColor = XColorWithRGB(89, 99, 109);
    label2.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(pwdTF);
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        
    }];
    
    UIView *line2  = [[UIView alloc]init];
    line2.backgroundColor = LineColor;
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(pwdTF.mas_bottom).offset(AdaptationWidth(2));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(18));
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(18));
        make.height.mas_equalTo(0.5);
    }];
    
    UIButton *autBtn = [[UIButton alloc]init];
    [autBtn setBorderWidth:1 andColor:AppMainColor];
    [autBtn setCornerValue:AdaptationWidth(22)];
    [autBtn setTitle:@"提交" forState:UIControlStateNormal];
    [autBtn setBackgroundColor:XColorWithRGB(56, 123, 230)];
    [autBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autBtn];
    [autBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line2).offset(AdaptationWidth(72));
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(AdaptationWidth(43));
        make.width.mas_equalTo(AdaptationWidth(250));
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
