//
//  UIImage+PKDownloadButton.m
//  Download
//
//  Created by Pavel on 31/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "UIImage+PKDownloadButton.h"

@implementation UIImage (PKDownloadButton)

+ (UIImage *)stopImageOfSize:(CGFloat)size color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, 1.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    
    CGRect stopImageRect = CGRectMake(0.f, 0.f, size, size);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddRect(context, stopImageRect);
    CGContextFillRect(context, stopImageRect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)pauseImageOfSize:(CGFloat)size color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), true, 1.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    [color setFill];
    
    CGRect line1 = CGRectMake(0.f, 0.f, size/3, size);
    CGContextAddRect(context, line1);
    CGContextFillRect(context, line1);
    CGContextStrokeRect(context, line1);
    
    
    CGRect line2 = CGRectMake(size * 2/3 , 0.f, size/3, size);
    CGContextAddRect(context, line2);
    CGContextFillRect(context, line2);
    CGContextStrokeRect(context, line2);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)buttonBackgroundWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30.f, 30.f), NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2.f, 2.f, 26.f, 26.f)
                                                          cornerRadius:4.f];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    bezierPath.lineWidth = 1.f;
    [bezierPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f)];
}

+ (UIImage *)highlitedButtonBackgroundWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(30.f, 30.f), NO, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2.f, 2.f, 26.f, 26.f)
                                                          cornerRadius:4.f];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    bezierPath.lineWidth = 1.f;
    [bezierPath stroke];
    [color setFill];
    [bezierPath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(10.f, 10.f, 10.f, 10.f)];
}

@end
