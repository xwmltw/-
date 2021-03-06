//
//  UITabBar+MKExtension.m
//  jianke
//
//  Created by xiaomk on 16/6/24.
//  Copyright © 2016年 xianshijian. All rights reserved.
//

#import "UITabBar+MKExtension.h"
#define MKUITabBarTagBase 900

@implementation UITabBar(MKExtension)
//显示小红点
- (void)showSmallBadgeOnItemIndex:(int)index{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = MKUITabBarTagBase + index;
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    float percentX = (index +0.6) / self.items.count;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为10
    [self addSubview:badgeView];
}


//隐藏小红点
- (void)hideSmallBadgeOnItemIndex:(int)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

- (void)clearAllSmallBadge{
    for (UIView *view in self.subviews) {
        NSInteger tag = view.tag;
        if (tag >= MKUITabBarTagBase && tag <= MKUITabBarTagBase + 10) {
            [view removeFromSuperview];
        }
    }
}

//移除小红点
- (void)removeBadgeOnItemIndex:(int)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == MKUITabBarTagBase + index) {
            [subView removeFromSuperview];
        }
    }
}

@end
