//
//  ViewController.m
//  text
//
//  Created by 王凯 on 2017/6/22.
//  Copyright © 2017年 王凯. All rights reserved.
//

#import "ViewController.h"
#import "TextTableViewController.h"

#import "textModel.h"

#import "UIButton+click.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    
    //step 1
    /**
     * 在 model初始化的时候 进行了几个基础方法的使用，比如 获取属性列表，方法名等，
     */
    textModel *model = [[textModel alloc] init];
    //step 2  动态添加方法。
    /** 
     * @selector(textsel:)方法本身是不存在的，正常情况下会crash。但是我们在model内部添加拦截方法，并且拦截到textsel调用的时候动态添加一个新的方法 ，并
     */
    [model performSelector:@selector(textsel:) withObject:@"哈哈哈哈"];
    
    
    //也许到这里 大家还不明白runtime 到底有什么用， 下面说到的是我在项目开发中的一些应用
    
    //step 3   添加关联对象
    // 按钮添加点击事件，
    UIButton *btn =[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor=[UIColor redColor];
    [self.view addSubview:btn];
    [btn handleAction:^{
        NSLog(@"====btnclick");
        //下个页面简单实现  给一个对象动态添加属性的运用，
        [self.navigationController pushViewController:[[TextTableViewController alloc] init] animated:YES];
         
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
