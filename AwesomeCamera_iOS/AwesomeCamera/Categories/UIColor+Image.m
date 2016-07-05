//
// Created by Casper Storm Larsen on 28/06/16.
// Copyright (c) 2016 Rise Digital. All rights reserved.
//

#import "UIColor+Image.h"
#import <UIKit/UIKit.h>

@implementation UIColor (Image)
- (UIImage *)rise_convertToImage {
    return [self rise_convertToImageWithSize:(CGSizeMake(1, 1))];
}

- (UIImage *)rise_convertToImageWithSize:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
            [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end