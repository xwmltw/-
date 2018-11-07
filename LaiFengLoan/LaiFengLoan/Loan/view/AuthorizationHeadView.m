//
//  AuthorizationHeadView.m
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/5.
//  Copyright © 2018年 xwm. All rights reserved.
//

#import "AuthorizationHeadView.h"

@implementation AuthorizationHeadView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self  = [[[NSBundle mainBundle]loadNibNamed:@"AuthorizationHead" owner:nil options:nil]firstObject];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
