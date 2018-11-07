//
//  ParamModel.h
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/6.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParamModel : NSObject
- (NSString *)getContent;
@end
//通用参数
@interface BaseInfoPM: ParamModel
@property (nonatomic ,copy) NSString *accessChannelCode;
@property (nonatomic ,copy) NSString *appVersionCode;
@property (nonatomic ,copy) NSNumber *clientType;
@property (nonatomic ,copy) NSString *imei;
@property (nonatomic ,copy) NSString *uid;

@end
@interface ClientGlobalInfo:ParamModel
@property (nonatomic ,copy) NSString *borrowDaysMax;
@property (nonatomic ,copy) NSString *borrowDaysMin;
@property (nonatomic ,copy) NSString *firstLoanAmtFixedDesc;
@property (nonatomic ,copy) NSString *firstLoanAmtFixedType;
@property (nonatomic ,copy) NSString *firstLoanAmtMin;
@property (nonatomic ,copy) NSString *notFirstLoanAmtFixedDesc;
@property (nonatomic ,copy) NSString *notFirstLoanAmtFixedType;
@property (nonatomic ,copy) NSString *notFirstLoanAmtMin;
@property (nonatomic ,copy) NSString *riskCreditAmtMax;
//存储数据
- (void)setClientGlobalInfoModel;
+ (ClientGlobalInfo *)getClientGlobalInfoModel;
//borrowDaysMax    string
//最长借款期限
//borrowDaysMin    string
//最短借款期限
//firstLoanAmtFixedDesc    string
//[首借]固定类型描述: 固定值时即为N个固定值,隔开; 区间值时表示金额颗粒度
//firstLoanAmtFixedType    string
//[首借]借款金额金额固定类型 1固定值，2区间值
//firstLoanAmtMin    string
//[首借]借款金额最低金额
//notFirstLoanAmtFixedDesc    string
//[非首借]固定类型描述: 固定值时即为N个固定值,隔开; 区间值时表示金额颗粒度
//notFirstLoanAmtFixedType    string
//[非首借]借款金额金额固定类型 1固定值，2区间值
//notFirstLoanAmtMin    string
//[非首借]借款金额最低金额
//riskCreditAmtMax    string
//风控最高授信额度
@end
