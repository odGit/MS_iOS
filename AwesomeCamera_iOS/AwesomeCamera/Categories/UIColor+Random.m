//
// Created by Casper Storm Larsen on 28/06/16.
// Copyright (c) 2016 Rise Digital. All rights reserved.
//

#import "UIColor+Random.h"


@implementation UIColor (Random)

+ (instancetype)rise_randomColor {
    CGFloat hue = (CGFloat) ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = (CGFloat) (( arc4random() % 128 / 256.0 ) + 0.5);  //  0.5 to 1.0, away from white
    CGFloat brightness = (CGFloat) (( arc4random() % 128 / 256.0 ) + 0.5);  //  0.5 to 1.0, away from black
    return [self colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end