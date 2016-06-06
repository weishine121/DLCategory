//
//  NSString+DLExtension.m
//  DLCategory
//
//  Created by weishine on 16/6/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "NSString+DLExtension.h"

@implementation NSString (DLExtension)

/**
 *  计算文件大小
 *
 *  @return 文件大小
 */
- (unsigned long long)fileSize{
    
    // 总大小
    unsigned long long size = 0;
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 是否为文件夹
    BOOL isDirectory = NO;
    
    // 路劲是否存在
    BOOL isExist = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!isExist) {
        return size;
    }
    if (isDirectory) {
        // 获取文件夹中所有文件的总大小
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullSubPath = [self stringByAppendingPathComponent:subpath];
            
            //累加文件大小
            size += [mgr attributesOfItemAtPath:fullSubPath error:nil].fileSize;
            
        }
    }else{
        
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    
    return size;
}

/*手机号码验证 MODIFIED BY HELENSONG*/
- (BOOL) isValidateMobile {
    //手机号以13, 15, 17, 18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:self];
}


- (BOOL)validateContainsSpace {
    return [self rangeOfString:@" "].location == NSNotFound;
}

- (NSString *)ageFromIDCard {
    NSMutableString *birthYear = nil;
    if (self.length == 15) {
        birthYear = [[self substringWithRange:NSMakeRange(6, 2)] mutableCopy];
        [birthYear insertString:@"19" atIndex:0];
    } else if (self.length == 18) {
        birthYear = [[self substringWithRange:NSMakeRange(6, 4)] mutableCopy];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    NSString *year = [formatter stringFromDate:[NSDate date]];
    NSInteger age = year.integerValue - birthYear.integerValue;
    if (age >= 0 && age < 200) {
        return [NSString stringWithFormat:@"%zd", age];
    } else {
        return @"未知";
    }
}

- (NSString*)birthdayFromIDCard {
    NSString *result = @"未知";
    if (self.length == 15) {
        NSMutableString *birthString = [[self substringWithRange:NSMakeRange(6, 6)] mutableCopy];
        [birthString insertString:@"19" atIndex:0];
        [birthString insertString:@"." atIndex:4];
        [birthString insertString:@"." atIndex:7];
        result = birthString;
    } else if (self.length == 18) {
        NSMutableString *birthString = [[self substringWithRange:NSMakeRange(6, 8)] mutableCopy];
        [birthString insertString:@"." atIndex:4];
        [birthString insertString:@"." atIndex:7];
        result = birthString;
    }
    
    return result;
}

- (NSString*)sexFromIDCard {
    NSString *sexString = @"";
    
    if (self.length == 15) {
        sexString =  [[self substringWithRange:NSMakeRange(14, 1)] mutableCopy];
    } else if (self.length == 18) {
        sexString = [[self substringWithRange:NSMakeRange(16, 1)] mutableCopy];
    }
    
    int x = sexString.intValue;
    if (x < 0 || sexString.length == 0) {
        return @"";
    }
    if (x % 2 == 0) {
        return @"女";
    } else {
        return @"男";
    }
    return sexString;
}


- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (NSString *)stringWithMoneyAmount:(double)amount {
    BOOL minus = amount < 0;
    if (minus) {
        amount = -amount;
    }
    NSMutableString *toString = [NSMutableString string];
    long round = floor(amount);
    int fraction = floor((amount - round + 0.005) * 100.0);
    NSString *fractionString = [NSString stringWithFormat:@".%02d", fraction];
    
    do {
        int thousand = round % 1000;
        if (round < 1000) {
            [toString insertString:[NSString stringWithFormat:@"%d", thousand] atIndex:0];
        } else {
            [toString insertString:[NSString stringWithFormat:@",%03d", thousand] atIndex:0];
        }
        round = round / 1000;
    } while (round);
    [toString appendString:fractionString];
    if (minus) {
        [toString insertString:@"-" atIndex:0];
    }
    return toString;
}

+ (NSString *)stringIntervalFrom:(NSDate *)start to:(NSDate *)end {
    NSInteger interval = end.timeIntervalSince1970 - start.timeIntervalSince1970;
    if (interval <= 0) {
        return @"刚刚";
    }
    
    if (interval < 60) {
        return [NSString stringWithFormat:@"%zd 秒前", interval];
    }
    
    interval = interval / 60;
    if (interval < 60) {
        return [NSString stringWithFormat:@"%zd 分钟前", interval];
    }
    
    interval = interval / 60;
    if (interval < 24) {
        return [NSString stringWithFormat:@"%zd 小时前", interval];
    }
    
    interval = interval / 24;
    if (interval < 7) {
        return [NSString stringWithFormat:@"%zd 天前", interval];
    }
    
    if (interval < 30) {
        return [NSString stringWithFormat:@"%zd 周前", interval / 7];
    }
    
    if (interval < 365) {
        return [NSString stringWithFormat:@"%zd 个月前", interval / 30];
    }
    return [NSString stringWithFormat:@"%zd 年前", interval / 365];
}
//邮箱
+ (BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}



@end