//
//  UIButton+click.h
//  text
//
//  Created by 王凯 on 2017/6/29.
//  Copyright © 2017年 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (click)

-(void)handleAction:(void(^)(void))block;

@end
