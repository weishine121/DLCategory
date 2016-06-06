//
//  UIView+DLExtension.h
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (DLExtension)

@property(nonatomic, assign) CGSize dl_size;
@property (nonatomic, assign) CGPoint dl_origin;

@property(nonatomic, assign) CGFloat dl_width;
@property(nonatomic, assign) CGFloat dl_height;

@property(nonatomic, assign) CGFloat dl_x;
@property(nonatomic, assign) CGFloat dl_y;
@property(nonatomic, assign) CGFloat dl_centerX;
@property(nonatomic, assign) CGFloat dl_centerY;

@property(nonatomic, assign) CGFloat dl_right;
@property(nonatomic, assign) CGFloat dl_bottom;

@property (nonatomic) CGFloat dl_left;
@property (nonatomic) CGFloat dl_top;

/************************* IBExtension **********************************/
/** 边线颜色 */
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
/** 边线宽度 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/** 脚半径 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;


@end
