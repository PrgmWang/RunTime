//
//  UIButton+click.m
//  text
//
//  Created by 王凯 on 2017/6/29.
//  Copyright © 2017年 王凯. All rights reserved.
//

#import "UIButton+click.h"
#import <objc/runtime.h>
@implementation UIButton (click)

typedef void(^Action) (void);
static char key;

-(void)handleAction:(void (^)(void))block{
    objc_setAssociatedObject(self, &key, block, OBJC_ASSOCIATION_COPY);
    [self addTarget:self action:@selector(click ) forControlEvents:UIControlEventTouchUpInside];
}
-(void)click{
    Action  block= objc_getAssociatedObject(self, &key);
    if (block) {
        block();
    }
}

@end
