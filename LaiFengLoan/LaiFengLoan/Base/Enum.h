//
//  Enum.h
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/2.
//  Copyright © 2018年 xwm. All rights reserved.
//

#ifndef Enum_h
#define Enum_h

typedef NS_ENUM(NSInteger , MyOrderState) {
    MyOrderStateAuditing,
    MyOrderStatePendMoney,
    MyOrderStatePendPay,
    MyOrderStateCleared,
    MyOrderStateRefuse,
};
#endif /* Enum_h */
