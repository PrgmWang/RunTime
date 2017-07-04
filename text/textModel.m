//
//  textModel.m
//  YunJuLogistics
//
//  Created by 王凯 on 2017/6/28.
//  Copyright © 2017年 王凯. All rights reserved.
//

#import "textModel.h"

#import <objc/runtime.h>
@implementation textModel

-(instancetype)init{
    self = [super init];
    if (self ) {
        [self text];
    }
    return self;
}
-(void)text{
    unsigned int count;
    
    //获取属性列表
    objc_property_t *prolist =class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyname =  property_getName(prolist[i]) ;
        NSLog(@"property----="">%@", [NSString stringWithUTF8String:propertyname]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Method method =  methodList[i];
        NSLog(@"method----="">%@", NSStringFromSelector(method_getName(method)));
    }
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Ivar myivar = ivarList[i];
        const char *ivarname =ivar_getName(myivar);
        NSLog(@"ivar----="">%@", [NSString stringWithUTF8String:ivarname]);
    }
}
-(void)gogogo{
    
}

void runAddMethod(id self, SEL _cmd, NSString *string){
    NSLog(@"add C IMP %@", string);
}
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    //给本类动态添加一个方法
    if ([NSStringFromSelector(sel) isEqualToString:@"textClick:"]) {
        class_addMethod(self, sel, (IMP)runAddMethod, "v@:*");
    }
    return YES;
}

@end
