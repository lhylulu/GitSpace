//
//  Person.m
//  通知的使用
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "Person.h"
#import "Company.h"

@implementation Person
- (void)personReceiveNotification:(NSNotification *)notification{
    //拿到消息的发送者
    Company *company = (Company *)(notification.object);
    
    NSString *compayName = company.comName;
    //发送的消息的名称
    NSString *mesName = notification.name;
    
    //拿出消息的具体内容
    NSDictionary *userInfo = notification.userInfo;
    
    NSLog(@"%@接收到了%@发送的%@消息，内容是%@",self.name,compayName,mesName,userInfo);
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
