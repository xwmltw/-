//
//  MyOrderFlowVC.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/6.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "MyOrderFlowVC.h"
#import "MyOrderFlowTableViewCell.h"

@interface MyOrderFlowVC ()

@end

@implementation MyOrderFlowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableViewWithFrame:CGRectZero];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.tableView.tableHeaderView = [self creatHeadView];
    self.tableView.tableFooterView = [self creatFoooterView];
}
- (UIView *)creatHeadView{
    UIView *view = [[UIView alloc]init];
    
    
    UILabel *orderID = [[UILabel alloc]init];
    [orderID setText:[NSString stringWithFormat:@"订单编号：  20181111519000（合同号）"]];
    [orderID setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [orderID setTextColor:LabelAssistantColor];
    [view addSubview:orderID];
    [orderID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view).offset(AdaptationWidth(18));
        make.left.mas_equalTo(view).offset(AdaptationWidth(18));
    }];
    
    UILabel *loanMoney = [[UILabel alloc]init];
    [loanMoney setText:[NSString stringWithFormat:@"借款金额：  20181111519000（合同号）"]];
    [loanMoney setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [loanMoney setTextColor:LabelAssistantColor];
    [view addSubview:loanMoney];
    [loanMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(orderID.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(orderID);
    }];
    
    UILabel *loanDate = [[UILabel alloc]init];
    [loanDate setText:[NSString stringWithFormat:@"借款期限：  20181111519000（合同号）"]];
    [loanDate setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [loanDate setTextColor:LabelAssistantColor];
    [view addSubview:loanDate];
    [loanDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loanMoney.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(loanMoney);
    }];
    
    UILabel * upMoney = [[UILabel alloc]init];
    [upMoney setText:[NSString stringWithFormat:@"到账金额：  20181111519000（合同号）"]];
    [upMoney setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [upMoney setTextColor:LabelAssistantColor];
    [view addSubview:upMoney];
    [upMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loanDate.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(loanDate);
    }];
    
    UILabel *upCard = [[UILabel alloc]init];
    [upCard setText:[NSString stringWithFormat:@"到账卡号： 20181111519000（合同号）"]];
    [upCard setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [upCard setTextColor:LabelAssistantColor];
    [view addSubview:upCard];
    [upCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(upMoney.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(upMoney);
    }];
    
    UILabel *repayMoney = [[UILabel alloc]init];
    [repayMoney setText:[NSString stringWithFormat:@"到期还款：  20181111519000（合同号）"]];
    [repayMoney setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [repayMoney setTextColor:LabelAssistantColor];
    [view addSubview:repayMoney];
    [repayMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(upCard.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(upCard);
    }];
    
    UILabel *repayDate = [[UILabel alloc]init];
    [repayDate setText:[NSString stringWithFormat:@"还款日期：  20181111519000（合同号）"]];
    [repayDate setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [repayDate setTextColor:LabelAssistantColor];
    [view addSubview:repayDate];
    [repayDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(repayMoney.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(repayMoney);
    }];
    
    UILabel *breakMoney = [[UILabel alloc]init];
    [breakMoney setText:[NSString stringWithFormat:@"违约金额：  20181111519000（合同号）"]];
    [breakMoney setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [breakMoney setTextColor:LabelAssistantColor];
    [view addSubview:breakMoney];
    [breakMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(repayDate.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(repayDate);
    }];
    
    UILabel *payMoney = [[UILabel alloc]init];
    [payMoney setText:[NSString stringWithFormat:@"应还总额：  20181111519000（合同号）"]];
    [payMoney setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [payMoney setTextColor:LabelAssistantColor];
    [view addSubview:payMoney];
    [payMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(breakMoney.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(breakMoney);
    }];
    
    UILabel *successDate = [[UILabel alloc]init];
    [successDate setText:[NSString stringWithFormat:@"还款成功时间：  20181111519000（合同号）"]];
    [successDate setFont:[UIFont systemFontOfSize:AdaptationWidth(14)]];
    [successDate setTextColor:LabelAssistantColor];
    [view addSubview:successDate];
    [successDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(payMoney.mas_bottom).offset(AdaptationWidth(10));
        make.left.mas_equalTo(payMoney);
    }];
    
    switch (self.orderState) {
        case MyOrderStateAuditing:
        case MyOrderStatePendMoney:
        {
            repayDate.hidden = YES;
            breakMoney.hidden = YES;
            payMoney.hidden = YES;
            successDate.hidden = YES;
            view.frame = CGRectMake(0, 0, ScreenWidth, AdaptationWidth(202));
        }
            break;
        case MyOrderStatePendPay:
        {
            successDate.hidden = YES;
            view.frame = CGRectMake(0, 0, ScreenWidth, AdaptationWidth(292));
        }
            break;
        case MyOrderStateCleared:
        {
            view.frame = CGRectMake(0, 0, ScreenWidth, AdaptationWidth(322));
        }
            break;
        case MyOrderStateRefuse:
        {
            [repayDate setText:[NSString stringWithFormat:@"订单进度：  20181111519000（合同号）"]];
            breakMoney.hidden = YES;
            payMoney.hidden = YES;
            successDate.hidden = YES;
            view.frame = CGRectMake(0, 0, ScreenWidth, AdaptationWidth(232));
        }
            break;
            
        default:
            break;
    }
    return view;
    
}
- (UIView *)creatFoooterView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, AdaptationWidth(126))];
    UIButton *autBtn = [[UIButton alloc]init];
    [autBtn setBorderWidth:1 andColor:AppMainColor];
    [autBtn setCornerValue:AdaptationWidth(22)];
    [autBtn setTitle:@"立即还款" forState:UIControlStateNormal];
    [autBtn setBackgroundColor:XColorWithRGB(56, 123, 230)];
    [autBtn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:autBtn];
    [autBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(view);
        make.height.mas_equalTo(AdaptationWidth(43));
        make.width.mas_equalTo(AdaptationWidth(250));
    }];
    return view;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = LineColor;
    [view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(view);
        make.height.mas_equalTo(0.5);
    }];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellHead"]];
    [view addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view).offset(AdaptationWidth(18));
        make.centerY.mas_equalTo(view);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"订单进度";
    label.textColor = LabelAssistantColor;
    label.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(14)];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(image.mas_right).offset(4);
        make.centerY.mas_equalTo(image);
    }];
    
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"OrderFlowCell";
    MyOrderFlowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MyOrderFlowTableViewCell" owner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
#pragma mark -btn
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
