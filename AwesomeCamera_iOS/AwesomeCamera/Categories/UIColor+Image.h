//
// Created by Casper Storm Larsen on 28/06/16.
// Copyright (c) 2016 Rise Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Image)
- (UIImage *)rise_convertToImage;
- (UIImage *)rise_convertToImageWithSize:(CGSize)size;
@end