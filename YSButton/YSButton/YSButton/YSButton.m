//
//  YSButton.m
//  test
//
//  Created by yaoshuai on 2019/7/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "YSButton.h"

@implementation YSButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect oriRect = [super titleRectForContentRect:contentRect];
    if (CGRectIsEmpty(self.titleRect) || CGRectEqualToRect(self.titleRect, CGRectZero)) {
        // 外界没有设置过titleRect
        return oriRect;
    } else {
        // 外界设置过titleRect
        CGRect rect = self.titleRect;
        if (rect.size.width <= 0){
            rect.size.width = oriRect.size.width;
        }
        if (rect.size.height <= 0){
            rect.size.height = oriRect.size.height;
        }
        return rect;
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect oriRect = [super imageRectForContentRect:contentRect];
    if (CGRectIsEmpty(self.imageRect) || CGRectEqualToRect(self.imageRect, CGRectZero)) {
        // 外界没有设置过imageRect
        return oriRect;
    } else {
        // 外界设置过imageRect
        CGRect rect = self.imageRect;
        if (rect.size.width <= 0){
            rect.size.width = oriRect.size.width;
        }
        if (rect.size.height <= 0){
            rect.size.height = oriRect.size.height;
        }
        return rect;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    BOOL notSetTitleRect = CGRectIsEmpty(self.titleRect) || CGRectEqualToRect(self.titleRect, CGRectZero);
    BOOL notSetImageRect = CGRectIsEmpty(self.imageRect) || CGRectEqualToRect(self.imageRect, CGRectZero);
    if (notSetTitleRect && notSetImageRect) {
        return;
    }
    CGRect currentRect = CGRectUnion(notSetTitleRect ? CGRectZero : self.titleRect, notSetImageRect ? CGRectZero : self.imageRect);
    CGRect rect = self.frame;
    if (currentRect.origin.x > 0){
        rect.size.width = currentRect.size.width + currentRect.origin.x * 2;
    } else{
        rect.size.width = currentRect.size.width;
    }
    if (currentRect.origin.y > 0){
        rect.size.height = currentRect.size.height + currentRect.origin.y * 2;
    } else{
        rect.size.height = currentRect.size.height;
    }
    self.frame = rect;
}

@end
