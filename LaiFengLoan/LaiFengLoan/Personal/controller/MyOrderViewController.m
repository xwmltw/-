//
//  MyOrderViewController.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderDetailVC.h"

@interface MyOrderViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation MyOrderViewController
static NSString *identifier = @"myDataCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    [self initUI];
}
- (void)initUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(AdaptationWidth(72), AdaptationWidth(73));
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(AdaptationWidth(30));
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(AdaptationWidth(80), AdaptationWidth(81));
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *image = [[UIImageView alloc]init];
    [cell.contentView addSubview:image];
    
    UILabel *nameLab = [[UILabel alloc]init];
    nameLab.textAlignment = NSTextAlignmentCenter;
    [nameLab setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:AdaptationWidth(12)]];
    [nameLab setTextColor:XColorWithRBBA(34, 58, 80, 0.32)];
    [cell.contentView addSubview:nameLab];
    
    UIImageView *authImage = [[UIImageView alloc]init];
    [cell.contentView addSubview:authImage];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(cell.contentView);
        make.bottom.mas_equalTo(nameLab.mas_top).offset(-AdaptationWidth(2));
    }];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(cell.contentView);
    }];
    [authImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(image);
    }];
    
    switch (indexPath.row) {
        case 0:
            nameLab.text = @"审核中";
            image.image = [UIImage imageNamed:@"审核中"];
            break;
        case 1:nameLab.text = @"待放款";
            image.image = [UIImage imageNamed:@"待放款"];
            
            break;
        case 2:
            nameLab.text = @"待还款";
            image.image = [UIImage imageNamed:@"待还款"];
            break;
        case 3:
            nameLab.text = @"已结清";
            image.image = [UIImage imageNamed:@"已结清"];
            break;
        case 4:
            nameLab.text = @"已拒绝";
            image.image = [UIImage imageNamed:@"已拒绝"];
            break;
            
        default:
            break;
    }
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    MyOrderDetailVC *vc = [[MyOrderDetailVC alloc]init];
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
