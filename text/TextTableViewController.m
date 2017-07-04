//
//  TextTableViewController.m
//  text
//
//  Created by 王凯 on 2017/6/29.
//  Copyright © 2017年 王凯. All rights reserved.
//

#import "TextTableViewController.h"
#import "TextTableViewCell.h"
#import "UITextField+SecTag.h"
@interface TextTableViewController ()<UITextFieldDelegate>

@end

@implementation TextTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO; 
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    /**
     *。 进入当前页面之后建议大家 先看看 图片    text.png  这是我当前项目中的一个表单页面，，，
     *   可以看得出有很多种不同的cell每个cell中又基本都有个。textFiled  通常情况下我们都会给textFiled 赋值tag  代理中进行tag的判断然后 一一对应不同的变量  最后提交表单
         问题来了：
         1.由于不同的cell 不同的分区。表单内容很大时  tag判断赋值过程繁杂，容易错。
         2.一旦某个section中要插入一个cell。 修改工作比较头疼
     *
     *   以上问题我也遇到了（这个图片的页面我前后一共修改过6次左右），所以今天特意选择了一个新的方法去尝试
     *   我用runtime机制。动态给textField  添加了一个新的。tag  secTag;   
     *   这样的话。我们只需要  tag=  indexPath.row  secTag =  indexPath.section
     *   通过两个tag 值 我们就可以准确定位到textFiel 所在的行 并对应变量
     *
     */
    
    
    //当然 这些方法都是我一个简单的运用，只为方便大家理解，  如果大家想要详细探究， jsonModel   AFN中都有大量运用，
}


#pragma mark UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TextTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TextTableViewCell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TextTableViewCell" owner:self options:nil] lastObject];
    }
    
    cell.inputField.tag= indexPath.row;
    [cell.inputField setSecTag:(id)[NSNumber numberWithInteger:indexPath.section]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"===%ld",indexPath.section);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"====sectag %@,tag =%ld",[textField getSecTag],textField.tag);
    return YES;
}

@end
