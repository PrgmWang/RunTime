//
//  UITextField+SecTag.m
//  text
//
//  Created by 王凯 on 2017/6/29.
//  Copyright © 2017年 王凯. All rights reserved.
//

#import "UITextField+SecTag.h"

#import <objc/runtime.h>
@implementation UITextField (SecTag)

static char secTagKey;

- (void) setSecTag:(id )secTag {
    objc_setAssociatedObject(self, &secTagKey, secTag, OBJC_ASSOCIATION_ASSIGN);
}

- (id) getSecTag{
    return objc_getAssociatedObject(self, &secTagKey);
}

@end
