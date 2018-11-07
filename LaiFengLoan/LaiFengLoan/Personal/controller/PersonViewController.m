//
//  PersonViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/3.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "PersonViewController.h"
#import "MyOrderViewController.h"
typedef NS_ENUM(NSInteger,PersonalBtnTag) {
    PersonalBtnTagBack,
    PersonalBtnTagLogin,
    PersonalBtnTagMyData,
    PersonalBtnTagMyOrder,
    PersonalBtnTagQuickPay,
    PersonalBtnTagBank,
};
@interface PersonViewController ()
@property (nonatomic , strong) NSMutableArray *sectionArry;
@property (nonatomic, strong) NSArray *cellTitleAry;
@property (nonatomic, strong) NSArray *btnAry;
@end

@implementation PersonViewController
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
    
    [self createTableViewWithFrame:CGRectZero];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.tableHeaderView = [self createHeaderView];
    
}
- (void)setData{
    self.cellTitleAry = [NSArray arrayWithObjects:@"修改密码",@"常见问题",@"意见反馈",@"关于XX", nil];
    self.btnAry = [NSArray arrayWithObjects:@(PersonalBtnTagMyData),@(PersonalBtnTagMyOrder),@(PersonalBtnTagQuickPay),@(PersonalBtnTagBank), nil];
    
}
- (UIView *)createHeaderView{
    UIView *view = [UIView gradientViewWithColors:@[XColorWithRGB(129, 178, 255),XColorWithRGB(56, 123, 230)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
    view.frame = CGRectMake(0, 0, self.tableView.width, AdaptationWidth(260));

    
    
    UIButton *backBtn =[[UIButton alloc]init];
    backBtn.tag = PersonalBtnTagBack;
    [backBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_whiteBack"] forState:UIControlStateNormal];
    [view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view).offset(10);
        make.top.mas_equalTo(view).offset(32);
        make.width.mas_equalTo(AdaptationWidth(12));
    }];
    
    UIButton *loginBtn =[[UIButton alloc]init];
    loginBtn.tag = PersonalBtnTagLogin;
    [loginBtn.titleLabel setFont:[UIFont systemFontOfSize:AdaptationWidth(20)]];
    [loginBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"请登录" forState:UIControlStateNormal];
    [loginBtn setBorderWidth:1 andColor:[UIColor whiteColor]];
    [loginBtn setCornerValue:4];
    [view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(view);
        make.top.mas_equalTo(view).offset(AdaptationWidth(81));
        make.width.mas_equalTo(AdaptationWidth(79));
        make.height.mas_equalTo(AdaptationWidth(35));
    }];
    
    UIImageView *dataImage = [[UIImageView alloc]init];
    dataImage.userInteractionEnabled  = NO;
    [dataImage setImage:[UIImage imageNamed:@"personal_headbg"]];
    [view addSubview:dataImage];
    [dataImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(view);
        make.height.mas_equalTo(AdaptationWidth(130));
        make.bottom.mas_equalTo(view).offset(AdaptationWidth(40));
    }];
    NSArray *titleAry = @[@"我的资料",@"我的订单",@"快速还款",@"银行卡"];
    NSArray *imageAry = @[@"personal_mydata",@"personal_myorder",@"personal_pay",@"personal_bank"];
    for (int i =0; i< 4; i++) {
        UIButton *dataBtn = [[UIButton alloc]initWithFrame:CGRectMake(AdaptationWidth(22)+((ScreenWidth-44)/4*i), AdaptationWidth(30), (ScreenWidth-44)/4, AdaptationWidth(80))];
        dataBtn.tag = (NSInteger)self.btnAry[i];
//        dataBtn.imageView.userInteractionEnabled = NO;
//        dataBtn.userInteractionEnabled = NO;
        [dataBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [dataBtn setImage:[UIImage imageNamed:imageAry[i]] forState:UIControlStateNormal];
        [dataBtn setTitle:titleAry[i] forState:UIControlStateNormal];
        [dataBtn setTitleColor:XColorWithRGB(22, 28, 42) forState:UIControlStateNormal];
        CGSize imageSize = dataBtn.currentImage.size;
        dataBtn.titleEdgeInsets = UIEdgeInsetsMake(imageSize.height+8, -imageSize.width, 0, 0);
        dataBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 15, 8,0 );
        [dataImage addSubview:dataBtn];

    }
    
    
    return view;
}

#pragma  mark - tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellTitleAry.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptationWidth(48);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AdaptationWidth(40);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"PersonalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.text = self.cellTitleAry[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MyOrderViewController *vc = [[MyOrderViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma  mark - btn
- (void)btnOnClick:(UIButton *)btn{
    switch (btn.tag) {
        case PersonalBtnTagBack:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case PersonalBtnTagMyData:{
            
        }
            break;
        case PersonalBtnTagMyOrder:{
            MyOrderViewController *vc = [[MyOrderViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case PersonalBtnTagQuickPay:{
            
        }
            break;
        case PersonalBtnTagBank:{
            
        }
            break;
        default:
            break;
    }
}
#pragma mark - 懒加载
-(NSMutableArray *)sectionArry{
    if (!_sectionArry) {
        _sectionArry = [NSMutableArray array];
    }
    return _sectionArry;
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
