//
//  AppUtils.h
//  LaiFengLoan
//
//  Created by yanqb on 2018/11/2.
//  Copyright © 2018年 xwm. All rights reserved.
//

#ifndef AppUtils_h
#define AppUtils_h


#endif /* AppUtils_h */

/** 网络环境*/
#ifdef DEBUG

#define SERVICEURL @"http://192.168.5.126:8081" // 外网测试环境

#else

#define SERVICEURL @"" //正式环境
#endif

/** TalkingData */
#ifdef DEBUG
static NSString *const TalkingData_AppID =   @"";
#else
static NSString *const TalkingData_AppID =   @"";
#endif

/** 极光*/
#ifdef DEBUG
static NSString *const JPAppKey = @"";
#else
static NSString *const JPAppKey = @"";
#endif


#define XUserLogin              @"/mapi/session/login"                     /*!< 登录*/
#define XUserRegister           @"/mapi/session/register"                  /*!< 注册*/
#define XModifyPassword         @"/mapi/session/updatePwd"                 /*!< 更新密码*/
#define XSMSCode                @"/mapi/valid/get_sms_code"                /*!< 短信验证码*/
#define XImageCode              @"/mapi/valid/get_image_code"              /*!< 图形验证码*/
#define XGetGlobal              @"/mapi/global/get_global_cfg"             /*!< 全局配置*/




















