//
//  main.m
//  通知的使用
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Person.h"

//No project file can't run

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Company *tencent = [[Company alloc]init];
        tencent.comName = @"腾讯";
        
        Company *sina = [[Company alloc]init];
        sina.comName = @"新浪";
        
        Company *net = [[Company alloc]init];
        net.comName = @"网易";
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];  //通知中心
        
        
        Person *zhangsan = [[Person alloc]init];
        zhangsan.name = @"张三";
        Person *lisi = [[Person alloc]init];
        lisi.name = @"李四";
        Person *wangerxiao = [[Person alloc]init];
        wangerxiao.name = @"王二小";
        Person *wangxiaoer = [[Person alloc]init];
        wangxiaoer.name = @"王小二";
        
        //张三监听新浪的体育
//        [center addObserver:zhangsan selector:@selector(personReceiveNotification) name:@"体育" object:sina];
        //张三接收网易的体育
//         [center addObserver:zhangsan selector:@selector(personReceiveNotification) name:@"体育" object:net];
        //张三不管谁发的体育消息，都接收
        //object:nil 就表示不管谁发的消息都收
        [center addObserver:zhangsan selector:@selector(personReceiveNotification:) name:@"体育" object:nil];
        
        //李四只接收网易发送的体育通知
        [center addObserver:lisi selector:@selector(personReceiveNotification:) name:@"体育" object:net];
        
        
        //只要是tencent发送的消息，都接收。
        [center addObserver:wangerxiao selector:@selector(personReceiveNotification:) name:nil object:tencent];
        
        //不管是谁发的什么消息，我都接收
        [center addObserver:wangxiaoer selector:@selector(personReceiveNotification:) name:nil object:nil];
        
        
        //tencent 表示消息的发送方
        //军事：发送的消息的内容
        [center postNotificationName:@"军事" object:tencent];
        [center postNotificationName:@"娱乐" object:tencent];
        
        
        
        [center postNotificationName:@"体育" object:sina userInfo:@{@"sport":@"中国男足勇夺3018年世界杯冠军"}];
        [center postNotificationName:@"政治" object:sina userInfo:@{@"政治":@"段王爷上台了！"}];
        
        
        
        NSNotification *gameNotification = [[NSNotification alloc]initWithName:@"游戏" object:net userInfo:nil];
        NSNotification *sportNotification = [[NSNotification alloc]initWithName:@"体育" object:net userInfo:@{@"体育":@"刘翔又上头条了！"}];
        
        [center postNotification:gameNotification];
        [center postNotification:sportNotification];

    
    }
    return 0;
}