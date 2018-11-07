//
//  LoanMainVC.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/1.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "LoanMainVC.h"
#import "SDCycleScrollView.h"
#import "LoginViewController.h"
#import "PersonViewController.h"
#import "LoanDetailViewController.h"
#import "IdentityViewController.h"
#import "ContactViewController.h"
#import "BaseViewController.h"
#import "OperatorViewController.h"

typedef NS_ENUM(NSInteger, LoanMainBtnTag) {
    LoanMainBtnTagMY,
    LoanMainBtnTagMessage,
    LoanMainBtnTagGetAmount,
    LoanMainBtnTagGoLoan,
};

@interface LoanMainVC ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *sdcycleScrollView;
@property (nonatomic, strong) NSArray *scrollArry;//banner图片组
@property (nonatomic, strong) UIButton *myBtn;
@property (nonatomic, strong) UIButton *messageBtn;
@property (nonatomic, strong) UIView *informationView;
@property (nonatomic, strong) UILabel *amountLab;
@end

@implementation LoanMainVC
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initHeaderUI];
}

- (void)initHeaderUI{
    
    self.sdcycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"Loan_headerBG"]];
    self.sdcycleScrollView.imageURLStringsGroup = self.scrollArry;
    self.sdcycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    _sdcycleScrollView.autoScrollTimeInterval = 3;
    _sdcycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    _sdcycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _sdcycleScrollView.pageDotColor = XColorWithRBBA(255, 255, 255, 0.4);
    if (self.scrollArry.count == 1) {
        self.sdcycleScrollView.autoScroll = NO;
    }
    [self.view addSubview:self.sdcycleScrollView];
    [self.sdcycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(AdaptationWidth(188));
    }];
    
    self.myBtn = [[UIButton alloc]init];
    self.myBtn.tag = LoanMainBtnTagMY;
    [self.myBtn setBackgroundImage:[UIImage imageNamed:@"myBtn"] forState:UIControlStateNormal];
    [self.myBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.myBtn];
    [self.myBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AdaptationWidth(28));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(12));
        make.width.height.mas_equalTo(AdaptationWidth(28));
    }];
    
    self.messageBtn = [[UIButton alloc]init];
    self.messageBtn.tag = LoanMainBtnTagMessage;
    [self.messageBtn setBackgroundImage:[UIImage imageNamed:@"messageBtn"] forState:UIControlStateNormal];
    [self.messageBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.messageBtn];
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(AdaptationWidth(28));
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-12));
        make.width.height.mas_equalTo(AdaptationWidth(28));
    }];
    
    self.informationView =[UIView gradientViewWithColors:@[XColorWithRGB(122, 176, 247),XColorWithRGB(56, 123, 230)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    [self.informationView setCornerValue:AdaptationWidth(6)];
    [self.view addSubview:self.informationView];
    [self.informationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.sdcycleScrollView.mas_bottom).offset(AdaptationWidth(22));
        make.left.mas_equalTo(self.view).offset(AdaptationWidth(45));
        make.right.mas_equalTo(self.view).offset(AdaptationWidth(-45));
        make.height.mas_equalTo(AdaptationWidth(160));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"最高可借(元)额度";
    label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    label.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(18)];
    [self.informationView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.informationView);
        make.top.mas_equalTo(self.informationView).offset(AdaptationWidth(26));
    }];
    
    self.amountLab = [[UILabel alloc] init];
    self.amountLab.text = @"20,000";
    self.amountLab.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    self.amountLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(33)];
    [self.informationView addSubview:_amountLab];
    [_amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.informationView);
        make.top.mas_equalTo(label.mas_bottom).offset(AdaptationWidth(6));
    }];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"额度高   |  审核简单   |   放款快 ";
    label2.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    label2.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(12)];
    [self.informationView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.informationView);
        make.bottom.mas_equalTo(self.informationView.mas_bottom).offset(AdaptationWidth(-23));
    }];
    
    UIButton *getBtn = [[UIButton alloc]init];
    getBtn.tag = LoanMainBtnTagGetAmount;
    [getBtn setCornerValue:AdaptationWidth(22)];
    [getBtn setTitle:@"获取额度" forState:UIControlStateNormal];
    [getBtn setBackgroundColor:AppMainColor];
    [getBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getBtn];
    [getBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.informationView);
        make.top.mas_equalTo(self.informationView.mas_bottom).offset(AdaptationWidth(32));
        make.width.mas_equalTo(AdaptationWidth(250));
        make.height.mas_equalTo(AdaptationWidth(43));
    }];
    
    UIButton *loanBtn = [[UIButton alloc]init];
    loanBtn.tag = LoanMainBtnTagGoLoan;
    [loanBtn setBorderWidth:1 andColor:AppMainColor];
    [loanBtn setCornerValue:AdaptationWidth(22)];
    [loanBtn setTitle:@"我要借款" forState:UIControlStateNormal];
    [loanBtn setBackgroundColor:XColorWithRGB(56, 123, 230)];
    [loanBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loanBtn];
    [loanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.informationView);
        make.top.mas_equalTo(getBtn.mas_bottom).offset(AdaptationWidth(18));
        
        make.width.height.mas_equalTo(getBtn);
    }];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"@copyright XX金融服务有限公司";
    label3.textColor = [UIColor colorWithRed:157/255.0 green:157/255.0 blue:157/255.0 alpha:1];
    label3.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(12)];
    [self.view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(AdaptationWidth(-18));
    }];
    
}
#pragma  makr - btn事件-
- (void)btnOnClick:(UIButton *)btn{
    
    switch (btn.tag) {
        case LoanMainBtnTagMY:
        {
            PersonViewController *vc = [[PersonViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case LoanMainBtnTagMessage:
        {
            if (![[UserInfo sharedInstance]isSignIn]) {
                [self getBlackLogin:self];
            }
        }
            break;
        case LoanMainBtnTagGetAmount:
        {
            if (![[UserInfo sharedInstance]isSignIn]) {
                [self getBlackLogin:self];
            }
            
            OperatorViewController *vc = [[OperatorViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case LoanMainBtnTagGoLoan:{
            if (![[UserInfo sharedInstance]isSignIn]) {
                [self getBlackLogin:self];
            }
            LoanDetailViewController *vc = [[LoanDetailViewController alloc]init];
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
