//
//  BaseViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "BaseViewController.h"
#import "AuthorizationHeadView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基本信息填写";
    [self initUI];
}
- (void)initUI{
    [self createTableViewWithFrame:CGRectZero];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.tableHeaderView = [[AuthorizationHeadView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, AdaptationWidth(90))];
    self.tableView.tableFooterView = [self creatFooterView];
    
}
- (UIView *)creatFooterView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, AdaptationWidth(100))];
    
    UIButton *autBtn = [[UIButton alloc]init];
    [autBtn setBorderWidth:1 andColor:AppMainColor];
    [autBtn setCornerValue:AdaptationWidth(22)];
    [autBtn setTitle:@"提交" forState:UIControlStateNormal];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BaseCell"];
    UILabel *nameLab = [[UILabel alloc] init];
    nameLab.textColor = XColorWithRGB(89, 99, 109);
    nameLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [cell.contentView addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(cell);
        make.left.mas_equalTo(cell).offset(AdaptationWidth(16));
        
    }];
    
    UIImageView *cellImage = [[UIImageView alloc]init];
    [cell.contentView addSubview:cellImage];
    [cellImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));
        make.centerY.mas_equalTo(cell);
        make.height.width.mas_equalTo(AdaptationWidth(28));
    }];
    
    UITextField *detailTF  = [[UITextField alloc]init];
    detailTF.textAlignment = NSTextAlignmentRight;
    detailTF.textColor = LabelMainColor;
    detailTF.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
    [cell addSubview:detailTF];
    
    switch (indexPath.row) {
        case 0:{
            nameLab.text = @"婚姻状况";
            detailTF.placeholder = @"请选择";
            cellImage.image = [UIImage imageNamed:@"contactCell_down"];
            [detailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell);
                make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));

            }];
        }
            break;
        case 1:{
            nameLab.text = @"现居住地址";
            detailTF.placeholder = @"请选择省市/地区";
            cellImage.image = [UIImage imageNamed:@"contactCell_down"];
            [detailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell);
                make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));

            }];
        }
            break;
        case 2:{
            nameLab.text = @"";
            detailTF.placeholder = @"请输入您的详细地址";
            [detailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell);
                make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));

            }];
        }
            break;
        case 3:{
            nameLab.text = @"公司名称";
            detailTF.placeholder = @"请输入公司名称";
            [detailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell);
                make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));

            }];
        }
            break;
        case 4:{
            nameLab.text = @"公司地址";
            detailTF.placeholder = @"请输入公司地址";
            [detailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell);
                make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));

            }];
        }
            break;
        case 5:{
            nameLab.text = @"公司电话";
            detailTF.placeholder = @"请输入公司电话";
            [detailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell);
                make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));

            }];
        }
            break;
        case 6:{
            nameLab.text = @"发薪日";
            detailTF.placeholder = @"请选择";
            cellImage.image = [UIImage imageNamed:@"contactCell_down"];
            [detailTF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(cell);
                make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));
                
            }];
        }
            break;
            
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - btn
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
