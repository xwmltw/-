//
//  LoanDetailViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/3.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "LoanDetailViewController.h"
#import "BankViewController.h"
typedef NS_ENUM(NSInteger, LoanDetailBtnTag) {
    LoanDetailBtnTagBack,
    LoanDetailBtnTagLoan,
    LoanDetailBtnTagSelect,
};
@interface LoanDetailViewController ()

@end

@implementation LoanDetailViewController
{
    UILabel *available;
    UILabel *creditlabel;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}
- (void)initUI{
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = AppMainColor;
    [self.view addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(AdaptationWidth(160));
    }];
    
    UIImageView *headImage = [[UIImageView alloc]init];
    [headImage setImage:[UIImage imageNamed:@"loanDetail_headbg"]];
    [headView addSubview:headImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(headView);
    }];
    
    UIButton *backBtn =[[UIButton alloc]init];
    backBtn.tag = LoanDetailBtnTagBack;
    [backBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_whiteBack"] forState:UIControlStateNormal];
    [headView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headView).offset(10);
        make.top.mas_equalTo(headView).offset(32);
        make.width.mas_equalTo(AdaptationWidth(12));
    }];
    
    available = [[UILabel alloc]init];
    [available setText:[NSString stringWithFormat:@"可用额度：￥1500"]];
    [available setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [available setTextColor:LabelMainColor];
    [self.view addSubview:available];
    [available mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(37));
        make.top.mas_equalTo(headView.mas_bottom).offset(AdaptationWidth(14));
    }];
    
    creditlabel = [[UILabel alloc]init];
    [creditlabel setText:[NSString stringWithFormat:@"授信额度：￥1500"]];
    [creditlabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [creditlabel setTextColor:LabelMainColor];
    [self.view addSubview:creditlabel];
    [creditlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).offset(-AdaptationWidth(37));
        make.top.mas_equalTo(headView.mas_bottom).offset(AdaptationWidth(14));
    }];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = XColorWithRGB(221, 221, 221);
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headView.mas_bottom);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(0.5);
        make.height.mas_equalTo(AdaptationWidth(48));
    }];
    
    UIView *line2 = [[UIView alloc]init];
    line2.backgroundColor = XColorWithRGB(221, 221, 221);
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(0.5);
    }];
    
    UILabel * loanMoneylabel = [[UILabel alloc]init];
    [loanMoneylabel setText:[NSString stringWithFormat:@"借款金额（元）"]];
    [loanMoneylabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [loanMoneylabel setTextColor:LabelMainColor];
    [self.view addSubview:loanMoneylabel];
    [loanMoneylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(37));
        make.top.mas_equalTo(line2.mas_bottom).offset(AdaptationWidth(30));
    }];
    
    
    UIButton *selectMoneyBtn = [[UIButton alloc]init];
    selectMoneyBtn.tag  = LoanDetailBtnTagSelect;
    [selectMoneyBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [selectMoneyBtn.titleLabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [selectMoneyBtn setTitle:@"500" forState:UIControlStateNormal];
    selectMoneyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [selectMoneyBtn setImage:[UIImage imageNamed:@"loanDetail_unselect"] forState:UIControlStateNormal];
    [selectMoneyBtn setTitleColor:LabelMainColor forState:UIControlStateNormal];
    
    selectMoneyBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.view addSubview:selectMoneyBtn];
    [selectMoneyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loanMoneylabel.mas_bottom).offset(AdaptationWidth(15));
        make.left.mas_equalTo(loanMoneylabel);
        make.width.mas_equalTo(AdaptationWidth(80));
    }];
    
    UIButton *selectMoneyBtn2 = [[UIButton alloc]init];
    selectMoneyBtn2.tag  = LoanDetailBtnTagSelect;
    [selectMoneyBtn2 addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [selectMoneyBtn2.titleLabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [selectMoneyBtn2 setTitle:@"1000" forState:UIControlStateNormal];
    selectMoneyBtn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [selectMoneyBtn2 setImage:[UIImage imageNamed:@"loanDetail_unselect"] forState:UIControlStateNormal];
    [selectMoneyBtn2 setTitleColor:LabelMainColor forState:UIControlStateNormal];
    selectMoneyBtn2.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.view addSubview:selectMoneyBtn2];
    [selectMoneyBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loanMoneylabel.mas_bottom).offset(AdaptationWidth(15));
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(AdaptationWidth(80));
    }];
    
    UIButton *selectMoneyBtn3 = [[UIButton alloc]init];
    selectMoneyBtn3.tag  = LoanDetailBtnTagSelect;
    [selectMoneyBtn3 addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [selectMoneyBtn3.titleLabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [selectMoneyBtn3 setTitle:@"1500" forState:UIControlStateNormal];
    selectMoneyBtn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [selectMoneyBtn3 setImage:[UIImage imageNamed:@"loanDetail_unselect"] forState:UIControlStateNormal];
    [selectMoneyBtn3 setTitleColor:LabelMainColor forState:UIControlStateNormal];
    selectMoneyBtn3.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [self.view addSubview:selectMoneyBtn3];
    [selectMoneyBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loanMoneylabel.mas_bottom).offset(AdaptationWidth(15));
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-37));
        make.width.mas_equalTo(AdaptationWidth(80));
    }];
    

    UILabel * loanDatelabel = [[UILabel alloc]init];
    [loanDatelabel setText:[NSString stringWithFormat:@"借款期限（天）"]];
    [loanDatelabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [loanDatelabel setTextColor:LabelMainColor];
    [self.view addSubview:loanDatelabel];
    [loanDatelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(37));
        make.top.mas_equalTo(selectMoneyBtn.mas_bottom).offset(AdaptationWidth(35));
    }];
    
    UIButton *selectDateBtn = [[UIButton alloc]init];
    selectDateBtn.tag  = LoanDetailBtnTagSelect;
    [selectDateBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [selectDateBtn.titleLabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [selectDateBtn setTitle:@"7" forState:UIControlStateNormal];
    selectDateBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [selectDateBtn setImage:[UIImage imageNamed:@"loanDetail_unselect"] forState:UIControlStateNormal];
    [selectDateBtn setTitleColor:LabelMainColor forState:UIControlStateNormal];
    
    selectDateBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.view addSubview:selectDateBtn];
    [selectDateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loanDatelabel.mas_bottom).offset(AdaptationWidth(15));
        make.left.mas_equalTo(loanDatelabel);
        make.width.mas_equalTo(AdaptationWidth(80));
    }];
    
    UIButton *selectDateBtn2 = [[UIButton alloc]init];
    selectDateBtn2.tag  = LoanDetailBtnTagSelect;
    [selectDateBtn2 addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [selectDateBtn2.titleLabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [selectDateBtn2 setTitle:@"14" forState:UIControlStateNormal];
    selectDateBtn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [selectDateBtn2 setImage:[UIImage imageNamed:@"loanDetail_unselect"] forState:UIControlStateNormal];
    [selectDateBtn2 setTitleColor:LabelMainColor forState:UIControlStateNormal];
    
    selectDateBtn2.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.view addSubview:selectDateBtn2];
    [selectDateBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loanDatelabel.mas_bottom).offset(AdaptationWidth(15));
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(AdaptationWidth(80));
    }];
    
    

    UIButton *loanBtn = [[UIButton alloc]init];
    [loanBtn setBackgroundColor:AppMainColor];
    [loanBtn setCornerValue:AdaptationWidth(22)];
    [loanBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loanBtn.titleLabel setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [loanBtn setTitle:@"立即借款" forState:UIControlStateNormal];
    [loanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:loanBtn];
    [loanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(selectDateBtn.mas_bottom).offset(AdaptationWidth(74));
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(AdaptationWidth(250));
        make.height.mas_equalTo(AdaptationWidth(43));
    }];
    
    UILabel * compayLab = [[UILabel alloc]init];
    [compayLab setText:[NSString stringWithFormat:@"@copyright XX金融服务有限公司"]];
    [compayLab setFont:[UIFont systemFontOfSize:AdaptationWidth(12)]];
    [compayLab setTextColor:LabelMainColor];
    [self.view addSubview:compayLab];
    [compayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-AdaptationWidth(18));
    }];
}
#pragma mark - btn
- (void)btnOnClick:(UIButton *)btn{
    switch (btn.tag) {
        case LoanDetailBtnTagBack:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case LoanDetailBtnTagLoan:{
            BankViewController *vc = [[BankViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
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
