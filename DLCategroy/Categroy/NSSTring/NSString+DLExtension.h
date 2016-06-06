//
//  NSString+DLExtension.h
//  DLCategory
//
//  Created by weishine on 16/6/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (DLExtension)

/** 文件大小 */
- (unsigned long long)fileSize;

/** 手机号码验证 MODIFIED BY HELENSONG */
- (BOOL) isValidateMobile;

/** 判断字段是否包含空格 */
- (BOOL)validateContainsSpace;

/** 根据身份证返回岁数 */
- (NSString *)ageFromIDCard;

/** 根据身份证返回生日 */
- (NSString*)birthdayFromIDCard;

/** 根据身份证返回性别 */
- (NSString*)sexFromIDCard;

/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)stringWithMoneyAmount:(double)amount;

+ (NSString *)stringIntervalFrom:(NSDate *)start to:(NSDate *)end;

/** 邮箱 */
+ (BOOL)validateEmail:(NSString *)email;

@end
