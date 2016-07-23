//
//  Person.h
//  通知的使用
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (copy, nonatomic) NSString *name;
- (void)personReceiveNotification:(NSNotification *)notification;
@end
