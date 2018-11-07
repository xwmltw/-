//
//  LiveViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "LiveViewController.h"
#import "AuthorizationHeadView.h"

@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活体识别";
    [self initUI];
}
- (void)initUI{
    AuthorizationHeadView *headView = [[AuthorizationHeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, AdaptationWidth(90))];
    [self.view addSubview:headView];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"将您的正脸通过扫描即可完成认证";
    label.textColor = LabelMainColor;
    label.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headView.mas_bottom).offset(AdaptationWidth(15));
        make.centerX.mas_equalTo(self.view);
    }];
    
    UIImageView *liveImage = [[UIImageView alloc]init];
    liveImage.image = [UIImage imageNamed:@"live_bg"];
    [self.view addSubview:liveImage];
    [liveImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(AdaptationWidth(50));
        make.centerX.mas_equalTo(self.view);
        make.height.width.mas_equalTo(AdaptationWidth(125));
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
