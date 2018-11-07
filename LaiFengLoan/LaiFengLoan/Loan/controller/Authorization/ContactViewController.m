//
//  ContactViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "ContactViewController.h"
#import "AuthorizationHeadView.h"
@interface ContactViewController ()
@property (nonatomic, strong) UITextField *nameTF;
@property (nonatomic, strong) UITextField *addressTF;
@property (nonatomic, strong) UITextField *name2TF;
@property (nonatomic ,strong) UILabel *parentLab;
@property (nonatomic ,strong) UILabel *parentTelLab;
@property (nonatomic ,strong) UILabel *parentAddressLab;
@property (nonatomic ,strong) UILabel *friendLab;
@property (nonatomic ,strong) UILabel *friendTelLab;


@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系人信息";
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    
    UIImageView *liveImage = [[UIImageView alloc]init];
    liveImage.image = [UIImage imageNamed:@"live_bg"];
    [view addSubview:liveImage];
    [liveImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view).offset(AdaptationWidth(16));
        make.centerY.mas_equalTo(view);
        make.height.width.mas_equalTo(AdaptationWidth(20));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = section == 0 ? @"联系人1" : @"联系人2";
    label.textColor = XColorWithRGB(89, 99, 109);
    label.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(18)];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view);
        make.left.mas_equalTo(liveImage.mas_right).offset(AdaptationWidth(8));
        
    }];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return section == 0 ? 5 : 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptationWidth(50);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString * identifier = @"ContactCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
       UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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

        if (indexPath.section == 0) {
            switch (indexPath.row) {
                case 0:
                {
                    nameLab.text = @"姓名";
                    self.nameTF  = [[UITextField alloc]init];
                    self.nameTF.textAlignment = NSTextAlignmentRight;
                    self.nameTF.textColor = LabelMainColor;
                    self.nameTF.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    self.nameTF.placeholder = @"请输入姓名";
                    [cell.contentView addSubview:self.nameTF];
                    [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));
                        
                    }];
                    
                }
                    break;
                case 1:
                {
                    nameLab.text = @"关系";
                    cellImage.image = [UIImage imageNamed:@"contactCell_down"];
                    self.parentLab  = [[UILabel alloc]init];
                    self.parentLab.textColor = XColorWithRGB(89, 99, 109);
                    self.parentLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    [cell.contentView addSubview:self.parentLab];
                    [self.parentLab mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));
                        
                    }];
                }
                    break;
                case 2:
                {
                    nameLab.text = @"电话号码";
                    cellImage.image = [UIImage imageNamed:@"contactCell_tel"];
                    self.parentTelLab  = [[UILabel alloc]init];
                    self.parentTelLab.textColor = XColorWithRGB(89, 99, 109);
                    self.parentTelLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    [cell.contentView addSubview:self.parentTelLab];
                    [self.parentTelLab mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));
                        
                    }];
                }
                    break;
                case 3:
                {
                    nameLab.text = @"家庭详细地址";
                    cellImage.image = [UIImage imageNamed:@"contactCell_down"];
                    self.parentAddressLab  = [[UILabel alloc]init];
                    self.parentAddressLab.textColor = XColorWithRGB(89, 99, 109);
                    self.parentAddressLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    [cell.contentView addSubview:self.parentAddressLab];
                    [self.parentAddressLab mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));
                        
                    }];
                }
                    break;
                case 4:
                {
                    nameLab.text = @"";
                    self.addressTF  = [[UITextField alloc]init];
                    self.addressTF.textAlignment = NSTextAlignmentRight;
                    self.addressTF.placeholder = @"请输入您的详细地址";
                    self.addressTF.textColor = XColorWithRGB(89, 99, 109);
                    self.addressTF.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    [cell.contentView addSubview:self.addressTF];
                    [self.addressTF mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));
                        
                    }];
                }
                    break;
                    
                default:
                    break;
            }
        }else{
            switch (indexPath.row) {
                case 0:
                {
                    nameLab.text = @"姓名";
                    self.name2TF  = [[UITextField alloc]init];
                    self.name2TF.textAlignment = NSTextAlignmentRight;
                    self.name2TF.textColor = LabelMainColor;
                    self.name2TF.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    self.name2TF.placeholder = @"请输入姓名";
                    [cell.contentView addSubview:self.name2TF];
                    [self.name2TF mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cell).offset(AdaptationWidth(-16));
                        
                    }];
                }
                    break;
                case 1:
                {
                    nameLab.text = @"关系";
                    cellImage.image = [UIImage imageNamed:@"contactCell_down"];
                    self.friendLab  = [[UILabel alloc]init];
                    self.friendLab.textColor = XColorWithRGB(89, 99, 109);
                    self.friendLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    [cell.contentView addSubview:self.friendLab];
                    [self.friendLab mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));
                        
                    }];
                }
                    break;
                case 2:
                {
                    nameLab.text = @"电话号码";
                    cellImage.image = [UIImage imageNamed:@"contactCell_tel"];
                    self.friendTelLab  = [[UILabel alloc]init];
                    self.friendTelLab.textColor = XColorWithRGB(89, 99, 109);
                    self.friendTelLab.font = [UIFont fontWithName:@"PingFang SC" size:AdaptationWidth(16)];
                    [cell.contentView addSubview:self.friendTelLab];
                    [self.friendTelLab mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.mas_equalTo(cell);
                        make.right.mas_equalTo(cellImage.mas_left).offset(AdaptationWidth(2));
                        
                    }];
                }
                    break;
                default:
                    break;
            }
        }
//    }
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
