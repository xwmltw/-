//
//  BankViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "IdentityViewController.h"
#import "AuthorizationHeadView.h"
#import "LiveViewController.h"
@interface IdentityViewController ()

@end

@implementation IdentityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份证认证";
    [self initUI];
}
- (void)initUI{
    AuthorizationHeadView *headView = [[AuthorizationHeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, AdaptationWidth(90))];
    [self.view addSubview:headView];
//    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.mas_equalTo(self.view);
//        make.height.mas_equalTo(AdaptationWidth(90));
//    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"将您的身份证正、反面通过扫描即可完成认证";
    label.textColor = LabelMainColor;
    label.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headView.mas_bottom).offset(AdaptationWidth(15));
        make.centerX.mas_equalTo(self.view);
    }];
    
    UIImageView *faceImage = [[UIImageView alloc]init];
    faceImage.image = [UIImage imageNamed:@"bank_face"];
    [self.view addSubview:faceImage];
    [faceImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(AdaptationWidth(40));
        make.centerX.mas_equalTo(self.view).multipliedBy(0.5);
        make.height.mas_equalTo(AdaptationWidth(100));
    }];
    
    UILabel *faceLab = [[UILabel alloc] init];
    faceLab.text = @"身份证正面";
    faceLab.textColor = LabelShallowColor;
    faceLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(12)];
    [self.view addSubview:faceLab];
    [faceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(faceImage.mas_bottom).offset(AdaptationWidth(13));
        make.left.mas_equalTo(faceImage);
    }];
    
    UIImageView *backImage = [[UIImageView alloc]init];
    backImage.image = [UIImage imageNamed:@"bank_back"];
    [self.view addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(AdaptationWidth(40));
        make.centerX.mas_equalTo(self.view).multipliedBy(1.5);
        make.height.mas_equalTo(AdaptationWidth(100));
    }];
    
    UILabel *backLab = [[UILabel alloc] init];
    backLab.text = @"身份证反面";
    backLab.textColor = LabelShallowColor;
    backLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(12)];
    [self.view addSubview:backLab];
    [backLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backImage.mas_bottom).offset(AdaptationWidth(13));
        make.left.mas_equalTo(backImage);
    }];
    
    UIButton *autBtn = [[UIButton alloc]init];
    [autBtn setBorderWidth:1 andColor:AppMainColor];
    [autBtn setCornerValue:AdaptationWidth(22)];
    [autBtn setTitle:@"开始认证" forState:UIControlStateNormal];
    [autBtn setBackgroundColor:XColorWithRGB(56, 123, 230)];
    [autBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autBtn];
    [autBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(AdaptationWidth(-85));
        make.height.mas_equalTo(AdaptationWidth(43));
        make.width.mas_equalTo(AdaptationWidth(250));
    }];
}
- (void)btnOnClick:(UIButton *)btn{
    LiveViewController *vc = [[LiveViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
