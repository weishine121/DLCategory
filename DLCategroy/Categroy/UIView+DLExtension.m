//
//  UIView+DLExtension.m
//  DLBaiSiBuDeQiJie
//
//  Created by iMac 11 on 16/5/5.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "UIView+DLExtension.h"

@implementation UIView (DLExtension)

- (CGFloat)dl_width {
  return self.frame.size.width;
}

- (void)setDl_width:(CGFloat)dl_width {
    CGRect frame = self.frame;
    frame.size.width = dl_width;
    self.frame = frame;
}

- (CGFloat)dl_height {
  return self.frame.size.height;
}

- (void)setDl_height:(CGFloat)dl_height {
  CGRect frame = self.frame;
  frame.size.height = dl_height;
  self.frame = frame;
}

- (CGSize)dl_size {
  return self.frame.size;
}

- (void)setDl_size:(CGSize)dl_size {
  CGRect frame = self.frame;
  frame.size = dl_size;
  self.frame = frame;
}

- (CGPoint)dl_origin {
    return self.frame.origin;
}

- (void)setDl_origin:(CGPoint)dl_origin {
    CGRect frame = self.frame;
    frame.origin = dl_origin;
    self.frame = frame;
}


- (CGFloat)dl_x {
  return self.frame.origin.x;
}

- (void)setDl_x:(CGFloat)dl_x {
  CGRect frame = self.frame;
  frame.origin.x = dl_x;
  self.frame = frame;
}

- (CGFloat)dl_y {
  return self.frame.origin.y;
}

- (void)setDl_y:(CGFloat)dl_y {
  CGRect frame = self.frame;
  frame.origin.y = dl_y;
  self.frame = frame;
}

- (CGFloat)dl_centerX {
  return self.center.x;
}

- (void)setDl_centerX:(CGFloat)dl_centerX {
  CGPoint center = self.center;
  center.x = dl_centerX;
  self.center = center;
}

- (CGFloat)dl_centerY {
  return self.center.y;
}

- (void)setDl_centerY:(CGFloat)dl_centerY {
  CGPoint center = self.center;
  center.y = dl_centerY;
  self.center = center;
}

- (CGFloat)dl_right {
  //    return self.dl_x + self.dl_width;
  return CGRectGetMaxX(self.frame);
}

- (void)setDl_right:(CGFloat)dl_right {
    self.dl_x = dl_right - self.dl_width;
}

- (CGFloat)dl_bottom {
  //    return self.dl_y + self.dl_height;
  return CGRectGetMaxY(self.frame);
}

- (void)setDl_bottom:(CGFloat)dl_bottom {
  self.dl_y = dl_bottom - self.dl_height;
}
- (CGFloat)dl_left {
    return self.frame.origin.x;
}

- (void)setDl_left:(CGFloat)dl_left {
    CGRect frame = self.frame;
    frame.origin.x = dl_left;
    self.frame = frame;
}

- (CGFloat)dl_top {
    return self.frame.origin.y;
}

- (void)setDl_top:(CGFloat)dl_top {
    CGRect frame = self.frame;
    frame.origin.y = dl_top;
    self.frame = frame;
}

+ (instancetype)dl_viewFromXib {
  return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}


/*************************IBExtension**********************************/
- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    
    // 栅格化 - 提高性能
    // 设置栅格化后，图层会被渲染成图片，并且缓存，再次使用时，不会重新渲染
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}


@end
